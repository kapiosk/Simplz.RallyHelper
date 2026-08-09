VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Rally Helper v1.2 by SpeedsterK"
   ClientHeight    =   6495
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   9375
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6495
   ScaleWidth      =   9375
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame7 
      Height          =   1095
      Left            =   7440
      TabIndex        =   69
      Top             =   5280
      Width           =   1815
      Begin VB.CommandButton Command13 
         Caption         =   "CalcuNote"
         Height          =   495
         Left            =   360
         TabIndex        =   70
         Top             =   360
         Width           =   1095
      End
   End
   Begin VB.Frame Frame6 
      Caption         =   "Advanced Error"
      Height          =   5055
      Left            =   7440
      TabIndex        =   57
      Top             =   120
      Width           =   1815
      Begin VB.CommandButton Command12 
         Caption         =   "Calc"
         Height          =   255
         Left            =   480
         TabIndex        =   68
         Top             =   4680
         Width           =   975
      End
      Begin VB.TextBox Text30 
         Height          =   285
         Left            =   480
         TabIndex        =   67
         Top             =   4200
         Width           =   975
      End
      Begin VB.TextBox Text29 
         Height          =   285
         Left            =   480
         TabIndex        =   66
         Top             =   3840
         Width           =   975
      End
      Begin VB.TextBox Text28 
         Height          =   285
         Left            =   480
         TabIndex        =   65
         Top             =   3360
         Width           =   975
      End
      Begin VB.TextBox Text27 
         Height          =   285
         Left            =   480
         TabIndex        =   64
         Top             =   3000
         Width           =   975
      End
      Begin VB.TextBox Text26 
         Height          =   285
         Left            =   480
         TabIndex        =   63
         Top             =   2520
         Width           =   975
      End
      Begin VB.TextBox Text25 
         Height          =   285
         Left            =   480
         TabIndex        =   62
         Top             =   2160
         Width           =   975
      End
      Begin VB.TextBox Text24 
         Height          =   285
         Left            =   480
         TabIndex        =   61
         Top             =   1680
         Width           =   975
      End
      Begin VB.TextBox Text23 
         Height          =   285
         Left            =   480
         TabIndex        =   60
         Top             =   1320
         Width           =   975
      End
      Begin VB.TextBox Text22 
         Height          =   285
         Left            =   480
         TabIndex        =   59
         Top             =   720
         Width           =   975
      End
      Begin VB.TextBox Text21 
         Height          =   285
         Left            =   480
         TabIndex        =   58
         Top             =   360
         Width           =   975
      End
   End
   Begin VB.CommandButton Command11 
      Caption         =   ">"
      Height          =   1335
      Left            =   6960
      TabIndex        =   56
      Top             =   3960
      Width           =   255
   End
   Begin MSComctlLib.ProgressBar ProgressBar1 
      Height          =   1335
      Left            =   6480
      TabIndex        =   55
      Top             =   3960
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   2355
      _Version        =   393216
      Appearance      =   1
      Max             =   60
      Orientation     =   1
   End
   Begin VB.Frame Frame5 
      Caption         =   "Misc"
      Enabled         =   0   'False
      Height          =   975
      Left            =   6480
      TabIndex        =   52
      Top             =   5400
      Width           =   735
      Begin VB.TextBox Text20 
         Height          =   285
         Left            =   120
         TabIndex        =   54
         Text            =   "30"
         Top             =   240
         Width           =   495
      End
      Begin VB.CommandButton Command10 
         Caption         =   "Jype"
         Height          =   255
         Left            =   120
         TabIndex        =   53
         Top             =   600
         Width           =   495
      End
   End
   Begin VB.Frame Frame4 
      Caption         =   "Timer2"
      Height          =   975
      Left            =   4800
      TabIndex        =   26
      Top             =   5400
      Width           =   1575
      Begin VB.TextBox Text14 
         Height          =   285
         Left            =   120
         TabIndex        =   31
         Text            =   "0"
         Top             =   240
         Width           =   375
      End
      Begin VB.TextBox Text13 
         Height          =   285
         Left            =   600
         TabIndex        =   30
         Text            =   "0"
         Top             =   240
         Width           =   375
      End
      Begin VB.TextBox Text12 
         Height          =   285
         Left            =   1080
         TabIndex        =   29
         Text            =   "0"
         Top             =   240
         Width           =   375
      End
      Begin VB.CommandButton Command8 
         Caption         =   "Start"
         Height          =   255
         Left            =   120
         TabIndex        =   28
         Top             =   600
         Width           =   615
      End
      Begin VB.CommandButton Command7 
         Caption         =   "Reset"
         Height          =   255
         Left            =   840
         TabIndex        =   27
         Top             =   600
         Width           =   615
      End
      Begin VB.Timer Timer2 
         Enabled         =   0   'False
         Interval        =   1000
         Left            =   600
         Top             =   720
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "Speed Time Table"
      Height          =   6255
      Left            =   120
      TabIndex        =   20
      Top             =   120
      Width           =   4575
      Begin VB.TextBox Text19 
         Height          =   285
         Left            =   3240
         TabIndex        =   49
         Top             =   840
         Width           =   855
      End
      Begin VB.CheckBox Check2 
         Caption         =   "Error Corr."
         Height          =   195
         Left            =   2040
         TabIndex        =   48
         Top             =   5880
         Width           =   1095
      End
      Begin VB.TextBox Text18 
         Height          =   285
         Left            =   3240
         TabIndex        =   45
         Top             =   480
         Width           =   855
      End
      Begin VB.TextBox Text15 
         Height          =   285
         Left            =   3240
         TabIndex        =   44
         Top             =   240
         Width           =   855
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Link Timer2"
         Height          =   255
         Left            =   3240
         TabIndex        =   36
         Top             =   5880
         Value           =   1  'Checked
         Width           =   1215
      End
      Begin VB.ListBox List3 
         Height          =   4545
         ItemData        =   "Rally Helper.frx":0000
         Left            =   2040
         List            =   "Rally Helper.frx":0002
         TabIndex        =   35
         Top             =   1200
         Width           =   2055
      End
      Begin VB.CommandButton Command9 
         Caption         =   "Create Table"
         Height          =   255
         Left            =   120
         TabIndex        =   34
         Top             =   5880
         Width           =   1815
      End
      Begin VB.ListBox List2 
         Height          =   4545
         ItemData        =   "Rally Helper.frx":0004
         Left            =   480
         List            =   "Rally Helper.frx":0006
         TabIndex        =   33
         Top             =   1200
         Width           =   1215
      End
      Begin VB.ListBox List1 
         Height          =   4545
         ItemData        =   "Rally Helper.frx":0008
         Left            =   120
         List            =   "Rally Helper.frx":000A
         TabIndex        =   32
         Top             =   1200
         Width           =   375
      End
      Begin VB.CommandButton Command6 
         Caption         =   "]"
         Height          =   315
         Left            =   2040
         TabIndex        =   25
         Top             =   480
         Width           =   195
      End
      Begin VB.TextBox Text11 
         Height          =   285
         Left            =   1440
         MaxLength       =   5
         TabIndex        =   24
         Top             =   720
         Width           =   495
      End
      Begin VB.TextBox Text10 
         Height          =   285
         Left            =   1440
         MaxLength       =   4
         TabIndex        =   23
         Top             =   360
         Width           =   495
      End
      Begin VB.Label Label14 
         Caption         =   "Error="
         Height          =   255
         Left            =   2280
         TabIndex        =   50
         Top             =   840
         Width           =   615
      End
      Begin VB.Label Label13 
         Caption         =   "Road Book="
         Height          =   255
         Left            =   2280
         TabIndex        =   47
         Top             =   480
         Width           =   975
      End
      Begin VB.Label Label12 
         Caption         =   "My="
         Height          =   255
         Left            =   2280
         TabIndex        =   46
         Top             =   240
         Width           =   735
      End
      Begin VB.Label Label7 
         Height          =   375
         Left            =   2400
         TabIndex        =   39
         Top             =   360
         Width           =   2055
      End
      Begin VB.Label Label6 
         Caption         =   "Speed (mph)="
         Height          =   255
         Left            =   240
         TabIndex        =   22
         Top             =   720
         Width           =   1095
      End
      Begin VB.Label Label5 
         Caption         =   "Speed (Km/h)="
         Height          =   255
         Left            =   240
         TabIndex        =   21
         Top             =   360
         Width           =   1095
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Timer1"
      Height          =   1335
      Left            =   4800
      TabIndex        =   14
      Top             =   3960
      Width           =   1575
      Begin VB.TextBox Text17 
         Height          =   285
         Left            =   1080
         TabIndex        =   38
         Text            =   "0"
         Top             =   600
         Width           =   375
      End
      Begin VB.TextBox Text16 
         Height          =   285
         Left            =   120
         TabIndex        =   37
         Text            =   "0"
         Top             =   600
         Width           =   855
      End
      Begin VB.Timer Timer1 
         Enabled         =   0   'False
         Interval        =   1000
         Left            =   600
         Top             =   1080
      End
      Begin VB.CommandButton Command5 
         Caption         =   "Reset"
         Height          =   255
         Left            =   840
         TabIndex        =   19
         Top             =   960
         Width           =   615
      End
      Begin VB.CommandButton Command4 
         Caption         =   "Start"
         Height          =   255
         Left            =   120
         TabIndex        =   18
         Top             =   960
         Width           =   615
      End
      Begin VB.TextBox Text9 
         Height          =   285
         Left            =   1080
         TabIndex        =   17
         Text            =   "0"
         Top             =   240
         Width           =   375
      End
      Begin VB.TextBox Text8 
         Height          =   285
         Left            =   600
         TabIndex        =   16
         Text            =   "0"
         Top             =   240
         Width           =   375
      End
      Begin VB.TextBox Text7 
         Height          =   285
         Left            =   120
         TabIndex        =   15
         Text            =   "0"
         Top             =   240
         Width           =   375
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "TSD Calculator"
      Height          =   3735
      Left            =   4800
      TabIndex        =   0
      Top             =   120
      Width           =   2415
      Begin VB.CommandButton Command3 
         Caption         =   "Add"
         Height          =   255
         Left            =   1320
         TabIndex        =   13
         Top             =   2160
         Width           =   975
      End
      Begin VB.TextBox Text6 
         Height          =   285
         Left            =   120
         MaxLength       =   10
         TabIndex        =   12
         Top             =   2160
         Width           =   1095
      End
      Begin VB.TextBox Text5 
         Height          =   285
         Left            =   960
         MaxLength       =   14
         TabIndex        =   10
         Top             =   720
         Width           =   1335
      End
      Begin VB.TextBox Text4 
         Height          =   285
         Left            =   960
         MaxLength       =   14
         TabIndex        =   6
         Top             =   1080
         Width           =   1335
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Clear"
         Height          =   255
         Left            =   1680
         TabIndex        =   5
         Top             =   1440
         Width           =   615
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Calculate"
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   1440
         Width           =   855
      End
      Begin VB.TextBox Text3 
         Height          =   285
         Left            =   1920
         MaxLength       =   2
         TabIndex        =   3
         Top             =   360
         Width           =   375
      End
      Begin VB.TextBox Text2 
         Height          =   285
         Left            =   1440
         MaxLength       =   2
         TabIndex        =   2
         Top             =   360
         Width           =   375
      End
      Begin VB.TextBox Text1 
         Height          =   285
         Left            =   960
         MaxLength       =   2
         TabIndex        =   1
         Top             =   360
         Width           =   375
      End
      Begin VB.Label Label15 
         Height          =   255
         Left            =   120
         TabIndex        =   51
         Top             =   3360
         Width           =   2175
      End
      Begin VB.Label Label11 
         Caption         =   "Current Time="
         Height          =   255
         Left            =   240
         TabIndex        =   43
         Top             =   3000
         Width           =   1095
      End
      Begin VB.Label Label10 
         Caption         =   "Start Time="
         Height          =   255
         Left            =   240
         TabIndex        =   42
         Top             =   2640
         Width           =   1095
      End
      Begin VB.Label Label9 
         Height          =   255
         Left            =   1440
         TabIndex        =   41
         Top             =   3000
         Width           =   855
      End
      Begin VB.Label Label8 
         Height          =   255
         Left            =   1440
         TabIndex        =   40
         Top             =   2640
         Width           =   855
      End
      Begin VB.Label Label4 
         Caption         =   "Distance Adder"
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   1800
         Width           =   1095
      End
      Begin VB.Label Label3 
         Caption         =   "Distance="
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   1080
         Width           =   855
      End
      Begin VB.Label Label2 
         Caption         =   "Speed="
         Height          =   255
         Left            =   120
         TabIndex        =   8
         Top             =   720
         Width           =   735
      End
      Begin VB.Label Label1 
         Caption         =   "Time="
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   360
         Width           =   615
      End
   End
   Begin VB.Line Line5 
      X1              =   9360
      X2              =   9360
      Y1              =   0
      Y2              =   6480
   End
   Begin VB.Line Line4 
      X1              =   7320
      X2              =   7320
      Y1              =   0
      Y2              =   6480
   End
   Begin VB.Line Line3 
      X1              =   9360
      X2              =   0
      Y1              =   6480
      Y2              =   6480
   End
   Begin VB.Line Line2 
      X1              =   0
      X2              =   0
      Y1              =   6480
      Y2              =   0
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   9360
      Y1              =   0
      Y2              =   0
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim ding As Integer
Dim stime, time1, time2 As String

Private Sub Command1_Click()
On Error Resume Next
Dim qwe As Integer
If Text1 = "" And Text2 = "" And Text3 = "" And Not (Text5 = "") Then qwe = 1
If Text4 = "" And Not (Text5 = "") Then qwe = 2
If Text5 = "" And Not (Text4 = "") Then qwe = 3

If qwe = 1 Then
Text1 = Int(Text4 / Text5)
Text2 = Int(Text4 / Text5 * 60 - Val(Text1) * 60)
Text3 = Round(Text4 / Text5 * 3600 - Val(Text2) * 60 - Val(Text1) * 60 * 60, 0)
End If

If qwe = 2 Then
Text4 = Val(Text5) * (Val(Text1) + Val(Text2) / 60 + Val(Text3) / 3600)
End If

If qwe = 3 Then
Text5 = (Val(Text4) / (Val(Text1) * 3600 + Val(Text2) * 60 + Val(Text3))) * 3600
End If

End Sub

Private Sub Command10_Click()
Text10.Text = Val(Text20)
Command9_Click
Command8_Click
Command7_Click
Command8_Click
Text10 = Text20
End Sub

Private Sub Command11_Click()
If Command11.Caption = ">" Then
    frmMain.Width = frmMain.Width + 2000
    Command11.Caption = "<"
Else
    frmMain.Width = frmMain.Width - 2000
    Command11.Caption = ">"
End If
End Sub

Private Sub Command12_Click()
On Error Resume Next
Text19 = (Text22 / Text21 + Text24 / Text23 + Text26 / Text25 + Text28 / Text27 + Text30 / Text29) / 5
End Sub

Private Sub Command13_Click()
    calcNote.Show
End Sub

Private Sub Command2_Click()
Text1 = ""
Text2 = ""
Text3 = ""
Text4 = ""
Text5 = ""
End Sub

Private Sub Command3_Click()
Text4 = Val(Text4) + Val(Text6)
End Sub

Private Sub Command4_Click()
If Command4.Caption = "Start" Then
    stime = Time
    Command4.Caption = "Pause"
    Timer1.Enabled = True
Else
    Command4.Caption = "Start"
    Timer1.Enabled = False
End If
End Sub

Private Sub Command5_Click()
Label8.Caption = ""
Label9.Caption = ""
Text16 = 0
Text17 = 0
Text9 = 0
Text8 = 0
Text7 = 0
End Sub

Private Sub Command6_Click()
If Text10 = "" Then Text10 = Val(Text11) * 1.6093 Else Text11 = Val(Text10) / 1.6093
End Sub

Private Sub Command7_Click()
ProgressBar1.Value = ProgressBar1.Min
Text12 = 0
Text13 = 0
Text14 = 0
End Sub

Private Sub Command8_Click()
If Command8.Caption = "Start" Then
    ding = 0
    Frame5.Enabled = True
    Command8.Caption = "Pause"
    Timer2.Enabled = True
    If IsNumeric(Mid$(List2.List(2), 8, 2)) Then
    ProgressBar1.Max = (Val(Mid$(List2.List(2), 8, 2)) * 60 + Val(Mid$(List2.List(2), 14, 2))) _
        - (Val(Mid$(List2.List(1), 8, 2)) * 60 + Val(Mid$(List2.List(1), 14, 2)))
    ProgressBar1 = ProgressBar1.Min
    End If
Else
    Command8.Caption = "Start"
    Timer2.Enabled = False
    Frame5.Enabled = False
End If
End Sub

Private Sub Command9_Click()

Dim err, err1, err2 As Currency
Command6_Click
err = 1
If Check2.Value = 0 Then
Else
    If IsNumeric(Text15) Then err1 = Val(Text15.Text) Else err1 = 1
    If IsNumeric(Text18) Then err2 = Val(Text18.Text) Else err2 = 1
    err = err2 / err1
    If Not (Text19 = "") Then err = Text19 Else Text19 = err
End If

If IsNumeric(Text11) And Not (Val(Text11) = 0) Then

Dim i As Integer
Dim m As Currency
Dim sh, sm, ss, se As String
List1.Clear
List2.Clear
List3.Clear
For i = 1 To 101
m = i / 10
If i <= 23 Then
    If m < 1 Then se = "0" + Str(m)
    If Round(m, 0) = m Then se = Str(m) + ".0" Else se = Str(m)
    List1.AddItem se
    th = Int(err * m / Val(Text11))
    tm = Int(err * m / Val(Text11) * 60 - th * 60)
    ts = Round(err * m / Val(Text11) * 3600 - tm * 60, 0)
    If Val(th) < 10 Then sh = " 0" + Mid(Str(th), 2, 1) Else sh = Str(th)
    If Val(tm) < 10 Then sm = " 0" + Mid(Str(tm), 2, 1) Else sm = Str(tm)
    If Val(ts) < 10 Then ss = " 0" + Mid(Str(ts), 2, 1) Else ss = Str(ts)
    List2.AddItem sh + " : " + sm + " : " + ss
Else
    th = Int(err * m / Val(Text11))
    tm = Int(err * m / Val(Text11) * 60 - th * 60)
    ts = Round(err * m / Val(Text11) * 3600 - tm * 60, 0)
    If Val(th) < 10 Then sh = " 0" + Mid(Str(th), 2, 1) Else sh = Str(th)
    If Val(tm) < 10 Then sm = " 0" + Mid(Str(tm), 2, 1) Else sm = Str(tm)
    If Val(ts) < 10 Then ss = " 0" + Mid(Str(ts), 2, 1) Else ss = Str(ts)
    If Round(m, 0) = m Then se = Str(m) + ".0" Else se = Str(m)
    List3.AddItem se + " | " + sh + " : " + sm + " : " + ss
End If
Next i
End If
End Sub

Private Sub Form_Load()
frmMain.Width = 7425
frmMain.Height = 6975
End Sub

Private Sub Text1_Click()
SendKeys "{Home}+{End}"
End Sub

Private Sub Text2_Click()
SendKeys "{Home}+{End}"
End Sub

Private Sub Text3_Click()
SendKeys "{Home}+{End}"
End Sub

Private Sub Text4_Click()
SendKeys "{Home}+{End}"
End Sub

Private Sub Text5_Click()
SendKeys "{Home}+{End}"
End Sub

Private Sub Text6_Click()
SendKeys "{Home}+{End}"
End Sub

Private Sub Text7_Click()
SendKeys "{Home}+{End}"
End Sub

Private Sub Text8_Click()
SendKeys "{Home}+{End}"
End Sub

Private Sub Text9_Click()
SendKeys "{Home}+{End}"
End Sub

Private Sub Text10_Click()
SendKeys "{Home}+{End}"
End Sub

Private Sub Text11_Click()
SendKeys "{Home}+{End}"
End Sub

Private Sub Text12_Click()
SendKeys "{Home}+{End}"
End Sub

Private Sub Text13_Click()
SendKeys "{Home}+{End}"
End Sub

Private Sub Text14_Click()
SendKeys "{Home}+{End}"
End Sub

Private Sub Text15_Click()
SendKeys "{Home}+{End}"
End Sub

Private Sub Text16_Click()
SendKeys "{Home}+{End}"
End Sub

Private Sub Text17_Click()
SendKeys "{Home}+{End}"
End Sub

Private Sub Text18_Click()
SendKeys "{Home}+{End}"
End Sub

Private Sub Text19_Click()
SendKeys "{Home}+{End}"
End Sub

Private Sub Text20_Click()
SendKeys "{Home}+{End}"
End Sub

Private Sub Text1_Change()
If Not (IsNumeric(Text1)) Then Text1 = ""
End Sub

Private Sub Text2_Change()
If Not (IsNumeric(Text2)) Then Text2 = ""
End Sub

Private Sub Text3_Change()
If Not (IsNumeric(Text3)) Then Text3 = ""
End Sub

Private Sub Text4_Change()
If Not (IsNumeric(Text4)) Then Text4 = ""
End Sub

Private Sub Text5_Change()
If Not (IsNumeric(Text5)) Then Text5 = ""
End Sub

Private Sub Text6_Change()
If Not (IsNumeric(Text6)) Then Text6 = ""
End Sub

Private Sub Text7_Change()
If Not (IsNumeric(Text7)) Then Text7 = ""
End Sub

Private Sub Text8_Change()
If Not (IsNumeric(Text8)) Then Text8 = ""
End Sub

Private Sub Text9_Change()
If Not (IsNumeric(Text9)) Then Text9 = ""
End Sub

Private Sub Text10_Change()
If Not (IsNumeric(Text10)) Then Text10 = ""
End Sub

Private Sub Text11_Change()
If Not (IsNumeric(Text11)) Then Text11 = ""
End Sub

Private Sub Text12_Change()
If Not (IsNumeric(Text12)) Then Text12 = ""
End Sub

Private Sub Text13_Change()
If Not (IsNumeric(Text13)) Then Text13 = ""
End Sub

Private Sub Text14_Change()
If Not (IsNumeric(Text14)) Then Text14 = ""
End Sub

Private Sub Text15_Change()
If Not (IsNumeric(Text15)) Then Text15 = ""
End Sub

Private Sub Text16_Change()
If Not (IsNumeric(Text16)) Then Text16 = ""
End Sub

Private Sub Text17_Change()
If Not (IsNumeric(Text17)) Then Text17 = ""
End Sub

Private Sub Text18_Change()
If Not (IsNumeric(Text18)) Then Text18 = ""
End Sub

Private Sub Text19_Change()
If Not (IsNumeric(Text19)) Then Text19 = ""
End Sub

Private Sub Text20_Change()
If Not (IsNumeric(Text20)) Then Text20 = ""
End Sub

Private Sub Timer1_Timer()
Label8.Caption = stime
Label9.Caption = Time
If Val(Text8) = 59 And Val(Text9) = 59 Then
    Text7 = Val(Text7) + 1
    Text8 = 0
    Text9 = -1
End If
If Val(Text9) = 59 Then
    Text8 = Val(Text8) + 1
    Text9 = -1
End If
Text9 = Val(Text9) + 1
Text17 = Text9
Text16 = Val(Text8) + Val(Text7) * 60
End Sub

Private Sub Timer2_Timer()
    
If time1 = time2 Then ProgressBar1 = ProgressBar1.Min

If Val(Text13) = 59 And Val(Text12) = 59 Then
    Text14 = Val(Text7) + 1
    Text13 = 0
    Text12 = -1
End If
If Val(Text12) = 59 Then
    Text13 = Val(Text13) + 1
    Text12 = -1
End If
Text12 = Val(Text12) + 1

If Check1.Value = 1 Then
    If ding < 23 Then time1 = List2.List(ding) Else time1 = Mid$(List3.List(ding - 23), 8, 16)
    If Val(Text14) < 10 Then time2 = " 0" + Text14 + " " Else time2 = " " + Text14 + " "
    If Val(Text13) < 10 Then time2 = time2 + ":  " + "0" + Text13 + " " Else time2 = time2 + ":  " + Text13 + " "
    If Val(Text12) < 10 Then time2 = time2 + ":  " + "0" + Text12 Else time2 = time2 + ":  " + Text12
    Label15.Caption = time1 + "  || " + time2
    If ProgressBar1.Max > ProgressBar1 Then ProgressBar1 = ProgressBar1 + 1
    If time1 = time2 Then ding = ding + 1
    If ding > 100 Then ding = 0
Else
End If

End Sub
