<%@ Page Title="Formulario de Registración" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Formulario1.aspx.cs" Inherits="Formulario1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Formulario de Registración</h2>
    <div>
        <asp:Label ID="Label1" runat="server" Text="Email:"></asp:Label>
        <asp:TextBox ID="TextBoxEmail" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" 
            ControlToValidate="TextBoxEmail" ErrorMessage="El campo Email es requerido." 
            ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" 
            ControlToValidate="TextBoxEmail" ErrorMessage="El formato del Email no es válido." 
            ForeColor="Red" ValidationExpression="\w+@\w+\.\w+"></asp:RegularExpressionValidator>
        <br />
        
        <asp:Label ID="Label2" runat="server" Text="UserName:"></asp:Label>
        <asp:TextBox ID="TextBoxUsername" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" runat="server" 
            ControlToValidate="TextBoxUsername" ErrorMessage="El campo UserName es requerido." 
            ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        
        <asp:Label ID="Label3" runat="server" Text="Edad:"></asp:Label>
        <asp:TextBox ID="TextBoxEdad" runat="server" type="number"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEdad" runat="server" 
            ControlToValidate="TextBoxEdad" ErrorMessage="El campo Edad es requerido." 
            ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidatorEdad" runat="server" 
            ControlToValidate="TextBoxEdad" ErrorMessage="La edad debe ser mayor a 15 años." 
            ForeColor="Red" MinimumValue="16" MaximumValue="150" Type="Integer"></asp:RangeValidator>
        <br />
        
        <asp:Label ID="Label4" runat="server" Text="Contraseña:"></asp:Label>
        <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" 
            ControlToValidate="TextBoxPassword" ErrorMessage="El campo Contraseña es requerido." 
            ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        
        <asp:Label ID="Label5" runat="server" Text="Repetir Contraseña:"></asp:Label>
        <asp:TextBox ID="TextBoxConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmPassword" runat="server" 
            ControlToValidate="TextBoxConfirmPassword" ErrorMessage="El campo Repetir Contraseña es requerido." 
            ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidatorPassword" runat="server" 
            ControlToValidate="TextBoxConfirmPassword" ControlToCompare="TextBoxPassword" 
            ErrorMessage="Las contraseñas no coinciden." ForeColor="Red"></asp:CompareValidator>
        <br />
        
        <asp:Button ID="Button1" runat="server" Text="Registrar" OnClick="Button1_Click" />
        <asp:Label ID="Label6" runat="server" Text="Label" Visible="False"></asp:Label>
    </div>
</asp:Content>
