<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="topProperty" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		
		<regionBase>
			<region id="mainReg" height="100%" width="100%" zIndex="1">
				<region id="matchReg" height="100%" width="100%" zIndex="2"/>
				<region id="btnMenuReg" height="5%" width="40%" right="5%" bottom="5%" zIndex="3"/>
				<region id="bio1VideoReg" height="50%" width="50%" left="0%" top="0%" zIndex="2"/>
				<region id="bio2VideoReg" height="50%" width="50%" left="0%" top="0%" zIndex="2"/>

				<region id="rgOutput1" width="50%" height="50%" bottom="0%" left="0%" zindex="2"/>
			</region>
		</regionBase>
		
		<descriptorBase>
			<descriptor id="mainDesc" region="mainReg"/>
			<descriptor id="matchDesc" region="matchReg"/>
			<descriptor id="btnMenuDesc" region="btnMenuReg"/>
			<descriptor id="bio1VideoDesc" region="bio1VideoReg"/>
			<descriptor id="bio2VideoDesc" region="bio2VideoReg"/>
			<descriptor id="dsOutput1" region="rgOutput1"/>
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
			<causalConnector id="onEndStop">
				<simpleCondition role="onEnd"/>
				<simpleAction role="stop"/>
			</causalConnector>
			<causalConnector id="onEndSet">
				<connectorParam name="resize_"/>
				<simpleCondition role="onEnd"/>
				<simpleAction role="set" value="$resize_"/>
			</causalConnector>
			<causalConnector id="onKeySelectionStopStart">
				<connectorParam name="tecla"/>
				<simpleCondition role="onSelection" key="$tecla"/>
				<compoundAction operator="par">
					<simpleAction role="stop"/>
					<simpleAction role="start"/>
				</compoundAction>
			</causalConnector>
			<causalConnector id="onBeginSet">
				<connectorParam name="var"/>
				<simpleCondition role="onBegin"/>
				<simpleAction role="set" value="$var"/>
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

		<media id="bio1VideoMedia" src="./resources/bio1.mp4" descriptor="bio1VideoDesc"/>

		<media id="bio2VideoMedia" src="./resources/bio2.mp4" descriptor="bio2VideoDesc"/>

		<media id="output1" src="output.lua" descriptor="dsOutput1">
			<property name="text"/>
		</media>

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

		<!-- Al presionar el botón verde (F2) (Bio jugador 1) cuando se está en el modo menú...-->
		<!-- Se elimina el video de la biografía del jugador 2-->
		<!-- Se agrega el video de la biografía del jugador 1-->
		<link xconnector="onKeySelectionStopStart">
			<bind role="onSelection" component="btnMenuMedia">
				<bindParam name="tecla" value="GREEN"/>
			</bind>
			<bind role="stop" component="bio2VideoMedia"/>
			<bind role="start" component="bio1VideoMedia"/>	
		</link>

		<!-- Al presionar el botón azúl (F4) (Volver) cuando se está en el modo menú y el video de biografía del jugador 1 está en pantalla...-->
		<!-- Se elimina el video de la biografía del jugador 1-->
		<link xconnector="onKeySelectionStop">
			<bind role="onSelection" component="btnMenuMedia">
				<bindParam name="tecla" value="BLUE"/>
			</bind>
			<bind role="stop" component="bio1VideoMedia"/>	
		</link>

		<!-- Al presionar el botón amarillo (F3) (Bio jugador 2) cuando se está en el modo menú...-->
		<!-- Se elimina el video de la biografía del jugador 2-->
		<!-- Se agrega el video de la biografía del jugador 2-->
		<link xconnector="onKeySelectionStopStart">
			<bind role="onSelection" component="btnMenuMedia">
				<bindParam name="tecla" value="YELLOW"/>
			</bind>
			<bind role="stop" component="bio1VideoMedia"/>	
			<bind role="start" component="bio2VideoMedia"/>	
		</link>

		<!-- Al presionar el botón azúl (F4) (Volver) cuando se está en el modo menú y el video de biografía del jugador 2 está en pantalla...-->
		<!-- Se elimina el video de la biografía del jugador 2-->
		<link xconnector="onKeySelectionStop">
			<bind role="onSelection" component="btnMenuMedia">
				<bindParam name="tecla" value="BLUE"/>
			</bind>
			<bind role="stop" component="bio2VideoMedia"/>	
		</link>

		<!-- Al presionar el botón rojo (F1) (Salir) cuando se está en el modo bio jugador 1...-->
		<!-- Se saca de pantalla el video de bio jugador 1-->
		<link xconnector="onKeySelectionStop">
			<bind role="onSelection" component="bio1VideoMedia">
				<bindParam name="tecla" value="RED"/>		
			</bind>
			<bind role="stop" component="bio1VideoMedia"/>		
		</link>

		<!-- Al presionar el botón rojo (F1) (Salir) cuando se está en el modo bio jugador 2...-->
		<!-- Se saca de pantalla el video de bio jugador 2-->
		<link xconnector="onKeySelectionStop">
			<bind role="onSelection" component="bio2VideoMedia">
				<bindParam name="tecla" value="RED"/>		
			</bind>
			<bind role="stop" component="bio2VideoMedia"/>		
		</link>

		<!-- Al iniciar el menu de botones...-->
		<!-- Se inicia el componente del texto con las estadísticas -->
		<link xconnector="onBeginStart">
			<bind role="onBegin" component="btnMenuMedia"/>
			<bind role="start" component="output1"/>
		</link>
		<!-- Se setea texto -->
		<link xconnector="onBeginSet">
			<bind role="onBegin" component="btnMenuMedia"/>
			<bind role="set" component="output1" interface="text">
				<bindParam name="var" value="$get"/>
			</bind>
		</link>

	</body>
</ncl>
