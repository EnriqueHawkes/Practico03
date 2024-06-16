<%@ Page Title="Gestión de Archivos" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Formulario2.aspx.cs" Inherits="Formulario2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Gestión de Archivos</h2>
    
    <asp:Label ID="LabelMessage" runat="server" ForeColor="Red" Visible="False"></asp:Label>
     <asp:Label ID="LabelUsuario" runat="server" ForeColor="Green">Usuario en Sesion:</asp:Label>
    
    <!-- Carga de archivos -->
    <h3>Cargar Archivos</h3>
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <asp:Button ID="ButtonUpload" runat="server" Text="Cargar Archivo" OnClick="ButtonUpload_Click" />
    
    <hr />
    
    <!-- Descarga de archivos -->
    <h3>Archivos Subidos</h3>
    <asp:GridView ID="GridViewFiles" runat="server" AutoGenerateColumns="False" EmptyDataText="No hay archivos disponibles" OnRowCommand="GridViewFiles_RowCommand" OnSelectedIndexChanged="GridViewFiles_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="FileName" HeaderText="Nombre de Archivo" />
            <asp:TemplateField HeaderText="Descargar">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButtonDownload" runat="server" Text="Descargar" CommandName="DownloadFile" CommandArgument='<%# Eval("FilePath") %>'></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
