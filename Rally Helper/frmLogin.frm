VERSION 5.00
Begin VB.Form frmLogin 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Login"
   ClientHeight    =   1545
   ClientLeft      =   2835
   ClientTop       =   3480
   ClientWidth     =   3750
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   912.837
   ScaleMode       =   0  'User
   ScaleWidth      =   3521.047
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtUserName 
      Height          =   345
      Left            =   1290
      MultiLine       =   -1  'True
      TabIndex        =   1
      Top             =   135
      Width           =   2325
   End
   Begin VB.CommandButton cmdOK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   390
      Left            =   495
      TabIndex        =   4
      Top             =   1020
      Width           =   1140
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   390
      Left            =   2100
      TabIndex        =   5
      Top             =   1020
      Width           =   1140
   End
   Begin VB.TextBox txtPassword 
      Height          =   345
      IMEMode         =   3  'DISABLE
      Left            =   1290
      PasswordChar    =   "*"
      TabIndex        =   3
      Top             =   480
      Width           =   2325
   End
   Begin VB.Label lblLabels 
      Caption         =   "&User Name:"
      Height          =   270
      Index           =   0
      Left            =   105
      TabIndex        =   0
      Top             =   150
      Width           =   1080
   End
   Begin VB.Label lblLabels 
      Caption         =   "&Password:"
      Height          =   270
      Index           =   1
      Left            =   105
      TabIndex        =   2
      Top             =   540
      Width           =   1080
   End
End
Attribute VB_Name = "frmLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function GetVolumeInformation Lib "kernel32" Alias "GetVolumeInformationA" (ByVal lpRootPathName As String, ByVal lpVolumeNameBuffer As String, ByVal nVolumeNameSize As Long, lpVolumeSerialNumber As Long, lpMaximumComponentLength As Long, lpFileSystemFlags As Long, ByVal lpFileSystemNameBuffer As String, ByVal nFileSystemNameSize As Long) As Long
Dim volbuf$, sysname$, serialnum&, sysflags&, componentlength&, res&

Private Sub cmdCancel_Click()
    End
End Sub

Private Sub cmdOK_Click()
    If txtPassword = "" And txtUserName = "NC757" Then
        frmMain.Show
        Unload Me
    Else
        MsgBox "Invalid Username or Password", , "Login"
        txtUserName.SetFocus
    End If
End Sub

Private Sub Form_Load()

volbuf$ = String$(256, 0)
sysname$ = String$(256, 0)
res = GetVolumeInformation("C:\", volbuf$, 255, serialnum&, _
        componentlength, sysflags, sysname$, 255)

checkregd = GetSetting("Rally Helper.exe", "Auth", "Key", "")

If Not (checkregd = serialnum&) Then
    plaq = InputBox("Unauthorised Computer", "Please Enter Validation Code:")
    If plaq = "004455" Then
        Call SaveSetting("Rally Helper.exe", "Auth", "Key", serialnum&)
    Else
        MsgBox "Unauthorised Computer/User"
        End
    End If
End If

End Sub

Private Sub txtPassword_GotFocus()
SendKeys "{Home}+{End}"
End Sub

Private Sub txtUserName_GotFocus()
SendKeys "{Home}+{End}"
End Sub
