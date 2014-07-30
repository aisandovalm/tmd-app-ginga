<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="topProperty" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">
	<head>
		
		<regionBase>
			<region id="mainReg" height="100%" width="100%" zIndex="2">
				<region id="videoReg" height="90%" width="90%" left="5%" zIndex="3"/>
				<region id="btn1Reg" height="10%" width="10%" left="5%" top="90%" zIndex="3"/>
				<region id="btn2Reg" height="10%" width="10%" left="15%" top="90%" zIndex="3"/>
			</region>
		</regionBase>
		
		<descriptorBase>
			<descriptor id="mainDesc" region="mainReg"/>
			<descriptor id="videoDesc" region="videoReg"/>
			<descriptor id="btn1Desc" region="btn1Reg"/>
			<descriptor id="btn2Desc" region="btn2Reg"/>
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
		<media id="background" src="./resources/images/bk.jpg" descriptor="mainDesc">
			<area id="btnOn" begin="2s"/>
		</media>
		<media id="video1" src="./resources/video1.mp4" descriptor="videoDesc">
			<property name="width" value="90%"/>
			<property name="height" value="90%"/>
			<property name="left" value="5%"/>
			<property name="right" value="0%"/>
			<property name="top" value="0%"/>
			<property name="bottom" value="0%"/>
		</media>	
		<media id="video2" src="./resources/video2.mp4" descriptor="videoDesc"/>
		<media id="btn1" src="./resources/images/button-green.jpg" descriptor="btn1Desc"/>
		<media id="btn2" src="./resources/images/button-red.jpg" descriptor="btn2Desc"/>

		<link xconnector="onBeginStart">
			<bind role="onBegin" component="background"/>
			<bind role="start" component="video1"/>
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
			<bind role="onSelection" component="video1">
				<bindParam name="tecla" value="GREEN"/>
			</bind>
			<bind role="set" component="video1" interface="width">
				<bindParam name="resize" value="50%"/>
			</bind>		
		</link>

		<link xconnector="onKeySelectionSet">
			<bind role="onSelection" component="video1">
				<bindParam name="tecla" value="GREEN"/>
			</bind>
			<bind role="set" component="video1" interface="height">
				<bindParam name="resize" value="50%"/>
			</bind>		
		</link>

		<link xconnector="onKeySelectionSet">
			<bind role="onSelection" component="video1">
				<bindParam name="tecla" value="GREEN"/>
			</bind>
			<bind role="set" component="video1" interface="left">
				<bindParam name="resize" value="36%"/>
			</bind>		
		</link>

		<link xconnector="onKeySelectionSet">
			<bind role="onSelection" component="video1">
				<bindParam name="tecla" value="GREEN"/>
			</bind>
			<bind role="set" component="video1" interface="top">
				<bindParam name="resize" value="32%"/>
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
		
		<!--
		<link xconnector="onKeySelectionStop">
			<bind role="onSelection" component="btn1">
				<bindParam name="tecla" value="RED"/>		
			</bind>
			<bind role="stop" component="btn1">
			</bind>				
		</link> -->
	</body>
</ncl>
