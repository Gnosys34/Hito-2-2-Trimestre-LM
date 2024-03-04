<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:key name="clienteKey" match="cliente" use="concat(nombre, '|', apellidos, '|', telefono, '|', correo_electronico)"/>
  <xsl:template match="/">
    <html>
      <head>
        <style>
          table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
          }
          th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
          }
          th {
            background-color: #f2f2f2;
          }
        </style>
      </head>
      <body>
        <h1>Lista de Pedidos</h1>
        <table>
          <tr>
            <th>Cliente</th>
            <th>Número de Pedido</th>
            <th>Fecha de Compra</th>
            <th>Fecha de Entrega</th>
            <th>Total de la Factura</th>
          </tr>
          <xsl:apply-templates select="//pedido"/>
        </table>
        <h1>Lista de Clientes</h1>
        <table>
          <tr>
            <th>Cliente</th>
            <th>Teléfono</th>
            <th>Dirección</th>
            <th>Email</th>
            <th>F. Inclusión</th>
          </tr>
          <xsl:apply-templates select="//cliente[generate-id() = generate-id(key('clienteKey', concat(nombre, '|', apellidos, '|', telefono, '|', correo_electronico))[1])]"/>
        </table>
     </body>
    </html>
  </xsl:template>
  <xsl:template match="pedido">
     <tr>
      <td>
        <xsl:value-of select="cliente/nombre"/><br/><xsl:value-of select="cliente/apellidos"/>
      </td>
      <td><xsl:value-of select="detalle_pedido/numero_pedido"/></td>
      <td><xsl:value-of select="detalle_pedido/fecha_compra"/></td>
      <td><xsl:value-of select="detalle_pedido/fecha_entrega"/></td>
      <td><xsl:value-of select="detalle_pedido/total_factura"/></td>
    </tr>
  </xsl:template>
  
  <xsl:template match="cliente">
    <tr>
      <td>
        <xsl:value-of select="nombre"/><br/><xsl:value-of select="apellidos"/>
      </td>
      <td><xsl:value-of select="telefono"/></td>
      <td><xsl:value-of select="direccion/calle"/><br/>
        <xsl:value-of select="direccion/ciudad"/><br/>
        <xsl:value-of select="direccion/codigo_postal"/><br/>
        <xsl:value-of select="direccion/provincia"/>
      </td>
      <td><xsl:value-of select="correo_electronico"/></td>
      <td><xsl:value-of select="fecha_inclusion"/></td>
    </tr>
  </xsl:template>
  
  
</xsl:stylesheet>
