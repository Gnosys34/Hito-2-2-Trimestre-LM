<!-- productos_vendidos_trimestre1_2021.xslt -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:key name="productoKey" match="producto" use="referencia"/>
  
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
        <h1>Productos Vendidos en el Trimestre 1 de 2021</h1>
        <table>
          <tr>
            <th>Referencia</th>
            <th>Nombre</th>
            <th>Precio</th>
            <th>Unidades Vendidas</th>
          </tr>
          <xsl:apply-templates select="//anio[@año='2021']/trimestre[@numero='1']/pedido/detalle_pedido/productos/producto"/>
        </table>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="producto">
    <xsl:variable name="referenciaActual" select="referencia"/>
    <tr>
      <td><xsl:value-of select="$referenciaActual"/></td>
      <td><xsl:value-of select="nombre"/></td>
      <td><xsl:value-of select="precio"/></td>
      <td>
        <xsl:value-of select="sum(//pedido[detalle_pedido/productos/producto/referencia = $referenciaActual]/detalle_pedido/productos/producto/unidades)"/>
      </td>
    </tr>
  </xsl:template>
  
</xsl:stylesheet>


