#tag Class
Protected Class FTTextField
Inherits FTTextFieldBase
	#tag Event
		Function DefaultParagraphStyle() As FTParagraphStyle
		  
		  #if not DebugBuild
		    
		    #pragma BoundsChecking FTC_BOUNDSCHECKING
		    #pragma NilObjectChecking FTC_NILOBJECTCHECKING
		    #pragma StackOverflowChecking FTC_STACKOVERFLOWCHECKING
		    
		  #endif
		  
		  Dim font as string
		  Dim size as integer
		  Dim ps as FTParagraphStyle
		  
		  ' Ask the subclass for style information.
		  ps = DefaultParagraphStyle
		  
		  ' Did we get it?
		  if ps is nil then
		    
		    ' Create a new style.
		    ps = new FTParagraphStyle(self)
		    
		    ' Get the system font characteristics.
		    FTUtilities.getSystemFontAndSize(font, size)
		    
		    ' Set the font and size.
		    ps.setFontName(font)
		    ps.setFontSize(size)
		    
		  end if
		  
		  ' Return the style.
		  return ps
		  
		End Function
	#tag EndEvent

	#tag Event
		Function KeyDown(key As String) As Boolean
		  
		  ' Scroll if needed.
		  scrollToCaret
		  
		  ' Call the event.
		  return KeyDown(key)
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub KeyUp(key As String)
		  
		  #if not DebugBuild
		    
		    #pragma BoundsChecking FTC_BOUNDSCHECKING
		    #pragma NilObjectChecking FTC_NILOBJECTCHECKING
		    #pragma StackOverflowChecking FTC_STACKOVERFLOWCHECKING
		    
		  #endif
		  
		  ' Scroll if needed.
		  scrollToCaret
		  
		  ' Call the event.
		  KeyUp(key)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseDrag(x as integer, y as integer)
		  
		  #if not DebugBuild
		    
		    #pragma BoundsChecking FTC_BOUNDSCHECKING
		    #pragma NilObjectChecking FTC_NILOBJECTCHECKING
		    #pragma StackOverflowChecking FTC_STACKOVERFLOWCHECKING
		    
		  #endif
		  
		  ' Scroll the display if needed.
		  scrollToMouse(x, y)
		  
		  ' Call the event.
		  MouseDrag(x, y)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  #if not DebugBuild
		    
		    #pragma BoundsChecking FTC_BOUNDSCHECKING
		    #pragma NilObjectChecking FTC_NILOBJECTCHECKING
		    #pragma StackOverflowChecking FTC_STACKOVERFLOWCHECKING
		    
		  #endif
		  
		  ' Don't accept tabs.
		  #if false
		    AcceptTabs = false
		  #endif
		  
		  ' Set it up for single line mode.
		  setSingleViewMode(0.04)
		  
		  ' Call the event.
		  Open
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function PasteAction() As boolean
		  
		  #if not DebugBuild
		    
		    #pragma BoundsChecking FTC_BOUNDSCHECKING
		    #pragma NilObjectChecking FTC_NILOBJECTCHECKING
		    #pragma StackOverflowChecking FTC_STACKOVERFLOWCHECKING
		    
		  #endif
		  
		  Dim cb as Clipboard
		  Dim text as string
		  Dim sa() as String
		  
		  ' Create a clipboard object.
		  cb = new Clipboard
		  
		  ' Is text available?
		  if cb.TextAvailable then
		    
		    ' Get the text from the clipboard.
		    text = FTUtilities.prepareText(cb.text)
		    
		    ' Break into lines.
		    sa = split(text, EndOfLine.Macintosh)
		    
		    ' Is there anything to work with?
		    if Ubound(sa) = -1 then
		      
		      ' Use an empty string.
		      insertText("")
		      
		    else
		      
		      ' Insert the text.
		      insertText(sa(0))
		      
		    end if
		    
		  end if
		  
		  ' Close the clipboard.
		  cb.close
		  
		  ' We handled it.
		  return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub TextChanged()
		  
		  #if not DebugBuild
		    
		    #pragma BoundsChecking FTC_BOUNDSCHECKING
		    #pragma NilObjectChecking FTC_NILOBJECTCHECKING
		    #pragma StackOverflowChecking FTC_STACKOVERFLOWCHECKING
		    
		  #endif
		  
		  ' Make sure the caret is visible.
		  scrollToCaret
		  
		  ' Call the event.
		  TextChanged
		  
		End Sub
	#tag EndEvent


	#tag Hook, Flags = &h0
		Event DefaultParagraphStyle() As FTParagraphStyle
	#tag EndHook

	#tag Hook, Flags = &h0
		Event KeyDown(key as string) As boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event KeyUp(key as string)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDrag(x as integer, y as integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TextChanged()
	#tag EndHook


	#tag ViewBehavior
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CornerColor"
			Visible=true
			Group="FT Behavior"
			InitialValue="&cFFFFFF00"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="UsePageShadow"
			Visible=true
			Group="FT Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="WordParagraphBackground"
			Visible=true
			Group="FT Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowBackgroundUpdates"
			Visible=true
			Group="FT Behavior"
			InitialValue="True"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowPictures"
			Visible=true
			Group="FT Behavior"
			InitialValue="True"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoComplete"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackgroundColor"
			Visible=true
			Group="FT Behavior"
			InitialValue="&cA0ADCD"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BorderColor"
			Visible=true
			Group="FT Behavior"
			InitialValue="&ca0a0a0"
			Type="color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BottomMargin"
			Visible=true
			Group="FT Page Mode"
			InitialValue="0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CaretColor"
			Visible=true
			Group="FT Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultFont"
			Visible=true
			Group="FT Defaults"
			InitialValue="Arial"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultFontSize"
			Visible=true
			Group="FT Defaults"
			InitialValue="12"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="defaultHyperLinkColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c0000ff"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="defaultHyperLinkColorDisabled"
			Visible=false
			Group="Behavior"
			InitialValue="&ccccccc"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="defaultHyperLinkColorRollover"
			Visible=false
			Group="Behavior"
			InitialValue="&cFF0000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="defaultHyperLinkColorVisited"
			Visible=false
			Group="Behavior"
			InitialValue="&c800080"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultTabStop"
			Visible=true
			Group="FT Defaults"
			InitialValue="0.5"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultTextColor"
			Visible=true
			Group="FT Defaults"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayAlignment"
			Visible=true
			Group="FT Mode"
			InitialValue="0"
			Type="Display_Alignment"
			EditorType="Enum"
			#tag EnumValues
				"0 - Left"
				"1 - Center"
				"2 - Right"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="DragAndDrop"
			Visible=true
			Group="FT Behavior"
			InitialValue="True"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DrawControlBorder"
			Visible=true
			Group="FT Behavior"
			InitialValue="true"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EditViewMargin"
			Visible=true
			Group="FT Edit Mode"
			InitialValue="0.06"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EditViewPrintMargin"
			Visible=true
			Group="FT Edit Mode"
			InitialValue="0.5"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HScrollbarAutoHide"
			Visible=true
			Group="FT Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InhibitSelections"
			Visible=true
			Group="FT Behavior"
			InitialValue="False"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InvisiblesColor"
			Visible=true
			Group="FT Behavior"
			InitialValue="&c526AFF"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsHiDPT"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LeftMargin"
			Visible=true
			Group="FT Page Mode"
			InitialValue="0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LimitText"
			Visible=true
			Group="FT Behavior"
			InitialValue=""
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MarginGuideColor"
			Visible=true
			Group="FT Behavior"
			InitialValue="&cCACACA"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Mask"
			Visible=true
			Group="FT Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Mode"
			Visible=true
			Group="FT Behavior"
			InitialValue=""
			Type="Display_Mode"
			EditorType="Enum"
			#tag EnumValues
				"0 - Page"
				"1 - Normal"
				"2 - Edit"
				"3 - Single"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="objectCountId"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PageHeight"
			Visible=true
			Group="FT Page Mode"
			InitialValue="11.0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PageWidth"
			Visible=true
			Group="FT Page Mode"
			InitialValue="8.5"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReadOnly"
			Visible=true
			Group="FT Behavior"
			InitialValue="False"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RightMargin"
			Visible=true
			Group="FT Page Mode"
			InitialValue="0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowInvisibles"
			Visible=true
			Group="FT Behavior"
			InitialValue="False"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowMarginGuides"
			Visible=true
			Group="FT Behavior"
			InitialValue="False"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowPilcrows"
			Visible=true
			Group="FT Behavior"
			InitialValue="False"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SpellCheckWhileTyping"
			Visible=true
			Group="FT Behavior"
			InitialValue="False"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TIC_PageTop"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TIC_xCaret"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TIC_yCaret"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TopMargin"
			Visible=true
			Group="FT Page Mode"
			InitialValue="0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="UndoLimit"
			Visible=true
			Group="FT Behavior"
			InitialValue="128"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="updateFlag"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VScrollbarAutoHide"
			Visible=true
			Group="FT Behavior"
			InitialValue="False"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="xDisplayAlignmentOffset"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
