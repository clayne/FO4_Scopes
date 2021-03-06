Scriptname Fallout:Scopes:Menu extends Quest
import Fallout
import Fallout:Scopes:Papyrus

; Methods
;---------------------------------------------

bool Function Load(string filePath)
	If (IsOpen)
		If (filePath)
			var[] arguments = new var[1]
			arguments[0] = filePath
			UI.Invoke(Name, GetMember("Load"), arguments)
			WriteLine(self, "Load", filePath)
			return true
		Else
			WriteUnexpectedValue(self, "Load", "filepath", "The argument cannot be none or empty.")
			return false
		EndIf
	Else
		WriteUnexpected(self, "Load", ToString()+" is not open.")
		return false
	EndIf
EndFunction


bool Function SetOverlay(int identifier)
	If (IsOpen)
		If (identifier >= Default && identifier <= Empty)
			var[] arguments = new var[1]
			arguments[0] = identifier
			UI.Invoke(Name, GetMember("SetOverlay"), arguments)
			WriteLine(self, "SetOverlay", identifier)
			return true
		Else
			WriteUnexpectedValue(self, "SetOverlay", "identifier", "The value of "+identifier+" is out of range.")
			return false
		EndIf
	Else
		WriteUnexpected(self, "SetOverlay", ToString()+" is not open.")
		return false
	EndIf
EndFunction


; Functions
;---------------------------------------------

string Function GetMember(string member)
	If (IsOpen)
		If (member)
			return Instance+"."+member
		Else
			WriteUnexpectedValue(self, "GetMember", "member", "The argument cannot be none or empty.")
			return none
		EndIf
	Else
		WriteUnexpected(self, "GetMember", ToString()+" is not open.")
		return none
	EndIf
EndFunction


string Function GetClient()
	If (IsOpen)
		return UI.Invoke(Name, GetMember("GetClient"))
	Else
		WriteUnexpected(self, "GetClient", ToString()+" is not open.")
		return none
	EndIf
EndFunction


string Function ToString()
	{The string representation of this type.}
	return "[Name:"+Name+", Path:"+Path+", Instance:"+Instance+"]"
EndFunction


; Properties
;---------------------------------------------

Group Properties
	string Property Name Hidden
		string Function Get()
			{The name of this menu.}
			return "ScopeMenu"
		EndFunction
	EndProperty

	string Property Path Hidden
		string Function Get()
			{The swf file path of this menu without the file extension. The root directory is "Data\Interface".}
			return "ScopeMenu"
		EndFunction
	EndProperty

	string Property Root Hidden
		string Function Get()
			{The top-level MovieClip that is not the stage.}
			return "root1"
		EndFunction
	EndProperty

	string Property Instance Hidden
		string Function Get()
			{The instance variable of this menu.}
			return Root+".ScopeMenuInstance"
		EndFunction
	EndProperty

	bool Property IsOpen Hidden
		bool Function Get()
			{Returns true if this menu is open.}
			return UI.IsMenuOpen(Name)
		EndFunction
	EndProperty
EndGroup

Group Identifiers
	int Property Default = 0 AutoReadOnly
	int Property Fine = 1 AutoReadOnly
	int Property Duplex = 2 AutoReadOnly
	int Property German = 3 AutoReadOnly
	int Property Dot = 4 AutoReadOnly
	int Property MilDot = 5 AutoReadOnly
	int Property Circle = 6 AutoReadOnly
	int Property OldRangefind = 7 AutoReadOnly
	int Property ModernRangefind = 8 AutoReadOnly
	int Property SVD = 9 AutoReadOnly
	int Property HandPainted = 10 AutoReadOnly
	int Property Binoculars = 11 AutoReadOnly
	int Property M14NightVision = 12 AutoReadOnly
	int Property Zero = 13 AutoReadOnly
	int Property InternalRangefinder = 14 AutoReadOnly
	int Property Rangefinder00 = 15 AutoReadOnly
	int Property AssaultRifle_REC = 16 AutoReadOnly
	int Property GaussRiflePrototypeA = 17 AutoReadOnly
	int Property GaussRiflePrototypeB = 18 AutoReadOnly
	int Property SolarCannon = 19 AutoReadOnly
	int Property SolarCannonNight = 20 AutoReadOnly
	int Property Empty = 21 AutoReadOnly
EndGroup
