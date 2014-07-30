<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="topProperty" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		
		<regionBase>
			<region id="mainReg" height="100%" width="100%" zIndex="1">
				<region id="matchReg" height="100%" width="100%" zIndex="2"/>

				<!-- Aparecerá un botón con un mensaje indicando que debe ser apretado
						para salir de las estadísticas y volver al partido en pantalla completa-->
				<region id="btnBackReg" height="10%" width="10%" left="5%" top="90%" zIndex="2"/>
			</region>
		</regionBase>
		
		<descriptorBase>
			<descriptor id="mainDesc" region="mainReg"/>
			<descriptor id="matchDesc" region="matchReg"/>
			<descriptor id="btnBackDesc" region="btnBackReg"/>
		</descriptorBase>

		<connectorBase>
			<causalConnector id="onKeySelectionStart">
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
		</connectorBase>
	</head>

	<body>
		<port component="background" id="entry"/>
		<media id="background" src="./resources/images/background.jpg" descriptor="mainDesc">
		</media>
		<media id="matchMedia" src="./resources/partido.mp4" descriptor="matchDesc">
			<!-- El video del partido se ajusta al tamaño de la pantalla completa-->
			<property name="width" value="100%"/>
			<property name="height" value="100%"/>
			<property name="right" value="0%"/>
			<property name="top" value="0%"/>
		</media>	

		<media id="btn1" src="./resources/images/button-green.jpg" descriptor="btnBackDesc"/>

		<link xconnector="onBeginStart">
			<bind role="onBegin" component="background"/>
			<bind role="start" component="matchMedia"/>
		</link>

		<link xconnector="onBeginStart">
			<bind role="onBegin" component="background" interface="btnOn"/>
			<bind role="start" component="btn1"/>
		</link>

		<link xconnector="onKeySelectionStop">
			<bind role="onSelection" component="btn1">
				<bindParam name="tecla" value="GREEN"/>		
			</bind>
			<bind role="stop" component="btn1"/>			
		</link>
		
		<link xconnector="onKeySelectionSet">
			<bind role="onSelection" component="matchMedia">
				<bindParam name="tecla" value="GREEN"/>
			</bind>
			<bind role="set" component="matchMedia" interface="width">
				<bindParam name="resize" value="50%"/>
			</bind>		
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
			<bind role="onEnd" component="btn1"/>
			<bind role="start" component="btn2"/>					
		</link>

		<link xconnector="onKeySelectionStop">
			<bind role="onSelection" component="btn2">
				<bindParam name="tecla" value="RED"/>		
			</bind>
			<bind role="stop" component="btn2">
			</bind>				
		</link>	
	</body>
</ncl>
