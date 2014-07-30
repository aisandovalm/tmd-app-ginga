<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="topProperty" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		
		<regionBase>
			<region id="mainReg" height="100%" width="100%" zIndex="1">
				<region id="matchReg" height="100%" width="100%" zIndex="2"/>
				<region id="btnMenuReg" height="5%" width="40%" right="5%" bottom="5%" zIndex="3"/>
			</region>
		</regionBase>
		
		<descriptorBase>
			<descriptor id="mainDesc" region="mainReg"/>
			<descriptor id="matchDesc" region="matchReg"/>
			<descriptor id="btnMenuDesc" region="btnMenuReg"/>
		</descriptorBase>

		<connectorBase>
			<causalConnector id="onKeySelectionStart">
				<connectorParam name="tecla"/>
				<simpleCondition role="onSelection" key="$tecla"/>
				<simpleAction role="start"/>
			</causalConnector>
			<causalConnector id="onKeySelectionStop">
				<connectorParam name="tecla"/>
				<simpleCondition role="onSelection" key="$tecla"/>
				<simpleAction role="stop"/>
			</causalConnector>
			<causalConnector id="onKeySelectionSet">
				<connectorParam name="tecla"/>
				<connectorParam name="resize"/>
				<simpleCondition role="onSelection" key="$tecla"/>
				<simpleAction role="set" value="$resize"/>
			</causalConnector>
			<causalConnector id="onBeginStart">
				<simpleCondition role="onBegin"/>
				<simpleAction role="start"/>
			</causalConnector>
			<causalConnector id="onEndStart">
				<simpleCondition role="onEnd"/>
				<simpleAction role="start"/>
			</causalConnector>
			<causalConnector id="onEndSet">
				<connectorParam name="resize_"/>
				<simpleCondition role="onEnd"/>
				<simpleAction role="set" value="$resize_"/>
			</causalConnector>
		</connectorBase>
	</head>

	<body>
		<port component="background" id="entry"/>
		<media id="background" src="./resources/images/background.jpg" descriptor="mainDesc">
		</media>
		<media id="matchMedia" src="./resources/match.mp4" descriptor="matchDesc">
			<!-- El video del partido se ajusta al tamaño de la pantalla completa-->
			<property name="width" value="100%"/>
			<property name="height" value="100%"/>
			<property name="right" value="0%"/>
			<property name="top" value="0%"/>
		</media>	

		<media id="btnMenuMedia" src="./resources/images/buttons-menu.png" descriptor="btnMenuDesc"/>

		<media id="btnStatsMedia" src="./resources/images/button-yellow.png" descriptor="btnStatsDesc"/>

		<media id="btnBackMedia" src="./resources/images/Red.png" descriptor="btnBackDesc"/>

		<!-- Al empezar el background, se inicia el video con el partido-->
		<link xconnector="onBeginStart">
			<bind role="onBegin" component="background"/>
			<bind role="start" component="matchMedia"/>
		</link>

		<!-- A presionar el botón rojo (F1), se ajusta el tamaño del video-->
		<!-- Se ajusta el ancho-->
		<link xconnector="onKeySelectionSet">
			<bind role="onSelection" component="matchMedia">
				<bindParam name="tecla" value="RED"/>
			</bind>
			<bind role="set" component="matchMedia" interface="width">
				<bindParam name="resize" value="50%"/>
			</bind>	
		</link>
		<!-- Se ajusta el alto-->
		<link xconnector="onKeySelectionSet">
			<bind role="onSelection" component="matchMedia">
				<bindParam name="tecla" value="RED"/>
			</bind>
			<bind role="set" component="matchMedia" interface="height">
				<bindParam name="resize" value="50%"/>
			</bind>	
		</link>

		<!-- Al presionar el botón rojo (F1), se muestra el menú con los botones-->
		<link xconnector="onKeySelectionStart">
			<bind role="onSelection" component="matchMedia">
				<bindParam name="tecla" value="RED"/>
			</bind>
			<bind role="start" component="btnMenuMedia"/>	
		</link>

		<!-- Al presionar el botón rojo (F1) (Salir) cuando se está en el modo menú...-->
		<!-- Se saca de pantalla el menú de botones -->
		<link xconnector="onKeySelectionStop">
			<bind role="onSelection" component="btnMenuMedia">
				<bindParam name="tecla" value="RED"/>		
			</bind>
			<bind role="stop" component="btnMenuMedia"/>			
		</link>

		<!-- Al sacar de pantalla el menú...-->
		<!-- Se reajusta el tamaño del video del partido-->
		<!-- Se ajusta el ancho-->
		<link xconnector="onEndSet">
			<bind role="onEnd" component="btnMenuMedia"/>
			<bind role="set" component="matchMedia" interface="width">
				<bindParam name="resize_" value="100%"/>
			</bind>	
		</link>
		<!-- Se ajusta el ancho-->
		<link xconnector="onEndSet">
			<bind role="onEnd" component="btnMenuMedia"/>
			<bind role="set" component="matchMedia" interface="height">
				<bindParam name="resize_" value="100%"/>
			</bind>	
		</link>


		<!-- Se ajusta el alto-->
		<!--
		<link xconnector="onKeySelectionSet">
			<bind role="onSelection" component="btnMenuMedia">
				<bindParam name="tecla" value="RED"/>
			</bind>
			<bind role="set" component="matchMedia" interface="height">
				<bindParam name="resize" value="100%"/>
			</bind>	
		</link>
		-->

		<!--
		<link xconnector="onKeySelectionStop">
			<bind role="onSelection" component="btnStatsMedia">
				<bindParam name="tecla" value="GREEN"/>		
			</bind>
			<bind role="stop" component="btnStatsMedia"/>			
		</link>		

		<link xconnector="onKeySelectionSet">
			<bind role="onSelection" component="matchMedia">
				<bindParam name="tecla" value="GREEN"/>
			</bind>
			<bind role="set" component="matchMedia" interface="height">
				<bindParam name="resize" value="50%"/>
			</bind>		
		</link>

		<link xconnector="onKeySelectionSet">
			<bind role="onSelection" component="matchMedia">
				<bindParam name="tecla" value="GREEN"/>
			</bind>
			<bind role="set" component="matchMedia" interface="right">
				<bindParam name="resize" value="0%"/>
			</bind>		
		</link>

		<link xconnector="onKeySelectionSet">
			<bind role="onSelection" component="matchMedia">
				<bindParam name="tecla" value="GREEN"/>
			</bind>
			<bind role="set" component="matchMedia" interface="top">
				<bindParam name="resize" value="0%"/>
			</bind>		
		</link>

		<link xconnector="onEndStart">
			<bind role="onEnd" component="btnStatsMedia"/>
			<bind role="start" component="btn2"/>					
		</link>

		<link xconnector="onKeySelectionStop">
			<bind role="onSelection" component="btn2">
				<bindParam name="tecla" value="RED"/>		
			</bind>
			<bind role="stop" component="btn2">
			</bind>				
		</link>	
	-->
	</body>
</ncl>
