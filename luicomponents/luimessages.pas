unit LuiMessages;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LMessages, LCLType, Controls;

const
  CM_PARENTBUTTONPRESSED = LM_USER + 1;
  CM_CHILDDATACHANGED = LM_USER + 2;
  CM_INIT = LM_USER + 3;

function NotifyParentForm(Control: TControl; Msg:Cardinal; WParam: WParam; LParam: LParam): LRESULT;

implementation

uses
  Forms;

function NotifyParentForm(Control: TControl; Msg: Cardinal; WParam: WParam; LParam: LParam): LRESULT;
var
  Form: TCustomForm;
begin
  Form := GetFirstParentForm(Control);
  if Form <> nil then
    Result := Form.Perform(Msg, WParam, LParam)
  else
    Result := 0;
end;

end.
