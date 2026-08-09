VERSION 5.00
Begin VB.Form calcNote 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Calculator / Notepad"
   ClientHeight    =   3015
   ClientLeft      =   2850
   ClientTop       =   4560
   ClientWidth     =   5175
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3015
   ScaleWidth      =   5175
   Begin VB.CommandButton Command6 
      Caption         =   "miles <- Km"
      Height          =   255
      Left            =   1200
      TabIndex        =   9
      Top             =   1560
      Width           =   975
   End
   Begin VB.CommandButton Command5 
      Caption         =   "miles -> Km"
      Height          =   255
      Left            =   120
      TabIndex        =   8
      Top             =   1560
      Width           =   975
   End
   Begin VB.CommandButton Command4 
      Caption         =   "+"
      Height          =   255
      Left            =   1920
      TabIndex        =   7
      Top             =   480
      Width           =   255
   End
   Begin VB.CommandButton Command3 
      Caption         =   "-"
      Height          =   255
      Left            =   1920
      TabIndex        =   6
      Top             =   120
      Width           =   255
   End
   Begin VB.CommandButton Command2 
      Caption         =   "*"
      Height          =   255
      Left            =   1560
      TabIndex        =   5
      Top             =   480
      Width           =   255
   End
   Begin VB.CommandButton Command1 
      Caption         =   "/"
      Height          =   255
      Left            =   1560
      TabIndex        =   4
      Top             =   120
      Width           =   255
   End
   Begin VB.TextBox Text4 
      Height          =   405
      Left            =   120
      TabIndex        =   3
      Top             =   1080
      Width           =   2055
   End
   Begin VB.TextBox Text3 
      Height          =   2775
      Left            =   2280
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   2
      Top             =   120
      Width           =   2775
   End
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Text            =   "0"
      Top             =   600
      Width           =   1335
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   120
      TabIndex        =   0
      Text            =   "0"
      Top             =   120
      Width           =   1335
   End
   Begin VB.Label Label1 
      Caption         =   "Speed = Distance / Time"
      Height          =   255
      Left            =   120
      TabIndex        =   10
      Top             =   1920
      Width           =   2055
   End
   Begin VB.Line Line4 
      X1              =   5160
      X2              =   5160
      Y1              =   0
      Y2              =   3000
   End
   Begin VB.Line Line3 
      X1              =   5160
      X2              =   0
      Y1              =   3000
      Y2              =   3000
   End
   Begin VB.Line Line2 
      X1              =   0
      X2              =   0
      Y1              =   3000
      Y2              =   0
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   5160
      Y1              =   0
      Y2              =   0
   End
End
Attribute VB_Name = "calcNote"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
If Not (Text2 = 0) Then Text4 = Text1 / Text2
End Sub

Private Sub Command2_Click()
Text4 = Text1 * Text2
End Sub

Private Sub Command3_Click()
Text4 = Text1 - Text2
End Sub

Private Sub Command4_Click()
Text4 = Val(Text1) + Val(Text2)
End Sub

Private Sub Command5_Click()
Text4 = Text1 * 1.6093
End Sub

Private Sub Command6_Click()
Text4 = Text1 / 1.6093
End Sub

Private Sub Text1_Change()
If Not (IsNumeric(Text1)) Then Text1 = ""
If Text1 = "" Then Text1 = 0
End Sub

Private Sub Text1_Click()
SendKeys "{Home}+{End}"
End Sub

Private Sub Text2_Change()
If Not (IsNumeric(Text2)) Then Text2 = ""
If Text2 = "" Then Text2 = 0
End Sub

Private Sub Text2_Click()
SendKeys "{Home}+{End}"
End Sub

Private Sub Text4_DblClick()
Text3.SetFocus
SendKeys "{ENTER}"
Text3 = Text4 + Text3
End Sub
