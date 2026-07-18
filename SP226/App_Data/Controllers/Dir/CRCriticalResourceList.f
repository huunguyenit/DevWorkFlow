<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu6yG9rBAXQSxPH5yYJ5SXR/o2leefYhldzE9DB+92duzSH/aVbxvTVy4ik+M1/9AU0oH/fokdsTTVWby6L5013RhzY+CDt2sn0UGpgaL7a7Ms0Q18K62PJsjXCZ5UDBmxw/iMS9RJPvBTS92om/f3FgPMBEcyRHzKGoID6oVWKBm50/nlnTTWhiKSWy417pAwabIBeC+lQDFVxT6JbCeOeAznEBlGkvmN0Kbiu9HYOQkFastBusiness.Encryption.End">
  
]>

<dir table="crdmnl" code="ma_nl" order="ma_nl" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nguồn lực chủ yếu" e="Critical Resource"></title>
  <fields>
    <field name="ma_nl" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã nguồn lực" e="Resource ID"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_nl" allowNulls="false">
      <header v="Tên nguồn lực" e="Description"></header>
    </field>
    <field name="ten_nl2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="dvt" allowNulls="false" onDemand="true">
      <header v="Đơn vị tính" e="UOM"></header>
      <items style="AutoComplete" controller="CRUnitCapacity" reference="ten_dvt%l" key="status = '1'" check="1 = 1" information="dvt$crdmdvt.ten_dvt%l"/>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="cong_suat" type="Decimal" dataFormatString="@CapacityNumberInputFormat" align="right">
      <header v="Công suất tiêu chuẩn" e="Standard Capacity"></header>
      <items style="Numeric"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
    <field name="crdmctnl" external="true" clientDefault="0" defaultValue="0" rows="218" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="CRCriticalResourceListDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_nl, ma_nl" e="String: ma_nl, ma_nl"></text>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="278" anchor="3">
      <item value="120, 100, 533"/>
      <item value="11: [ma_nl].Label, [ma_nl]"/>
      <item value="110: [ten_nl].Label, [ten_nl]"/>
      <item value="110: [ten_nl2].Label, [ten_nl2]"/>
      <item value="111: [dvt].Label, [dvt], [ten_dvt%l]"/>
      <item value="11: [cong_suat].Label, [cong_suat]"/>
      <item value="1: [crdmctnl]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="-1" columns="120, 30, 700, 533" anchor="4">
          <header v="" e=""/>
        </category>
      </categories>
    </view>
  </views>

  <commands>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIwnNT02Li4WdmXi5WNXKY6Wn6JihkASXDf9zA5cDUxDS8neYyPkBi/ZrKbxhuS4L68g0H7SIgUCNkQKuBKyWGd7CTbOqlov0hH435jcbmXItkiDahxeluQh9ei4eaqkFEMM8NM3jeFTW3ZeivcxuiY1RDOXBeRCyBPsLEjqJGnfkmWZMQIc6JyO5K6RZFDgHjhn+HBwNv1KMsLMO9mXrOmwg9nnlbdPRJIrKNLF4IgyKtfVVWmIS09JViQRN0PZF5VAKWv2bhwrEkFko/PmqOLK8LJOEU/lyxc/c5GKek0nIfdPqpCda5KBVf8whN/VbBQac/Jdg4fjAwWF3jOocRlhC7rZvpmpK9zBn19UhCYzo=</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZPRiKEfPKjxHBmJnvU1lVsEVAeKiADW9XDnmjeMulMqIEkO1wH0NCWapsmC11yQQFBAsR9jtjDLTK2pxk0JxW53BtrrBG9wdfJxw0XQER7JbY2KEHoI0JHiAQOPCwWYhokvI2CXBzc49kNt5Sh+WtByu2WTawkGYQ6Vi5CP0SAuMCwKH+NUzLkvGEAj4zl7znUugJ7rUSwk149dN11yzaT9OnO1ZwioIg219yw/f6ng==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPET7IzByDo3iePrPQapqdYnHe5PngOvG/5/7QsWcdQEGHHmyv5fuYZzFqWn2wS/NQcO1BchHeMAJFpEj+DjMty/4zdn0GY0yWSWQMBugkY9</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7CpCvUErFeuz/89vhJ57pcPaCsBOYdaGb9OoGh0N+najMOCuIiOWm37h+NcaPc8ZdW05pafqowq5GaUuRI7jVNElAy+1myQXpTXEDZD84p1qhlotl4CDmofXyViiXuoI6AfiztvRy0jeKlR1PELsIRJ9qblV9F3xqrOm4pG85J3dJoirAhL0GMx6h/9QR3sO890N9HdV5S9Tt1E0z/XyVEZRX9pI9OCWO3696xe/ecxWmqPhnESvaDzMTOqu18Xtfv</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5xx4uUW+vFbOcJ9adiDlY9Eo5fb8F3fFgpGbUEfo4dCx1BvMxfaGv4YL+YIpQX1cSE5/3F8Jp7w8oTAZ1glgCRf3Yn8d1IEYL9qzSIwrQm3NHlQlUp0e2/8toGLJkNNhjo=</Encrypted>]]>
        &AfterUpdate;
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp9ozwmNWaFXFGEKfmQZvzteLtR+Y4ZXBh/vZ2W9zX/kHqnVGyWotEOy2gQ76oUsVlwteDOlfOlAZQef7scILH6FTFjWSE1GY+zx83QoKgTO5wDkeTRQwsgboVkO1ReJeEzbDu2HjsUjeWKQ+2qSBsR5dUMw0gxKPZYFiB5uFRRJz+2AI0bt7M6v0jZyzATp+ZBaN16JVeP95IeGef2fsSGcjMXmbgPEqeJrqWGCx/xvn8qMeCrhfIaoDowldNFZx4HkFnQikzkyHig0SAkyMUSjLJyd49lfqJZHzCc0bwSG2owbUCci5JuXZ3CE6p/Clgewc/mzBGPYuWsAl93dt8hIHWSCtD4M08CW5ET36CySOPCp6p3MGrf6gHqY5FgoACI=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV1BiaKGGtarAF2YGa+QZRgNCQMMTdhOXC9/RBc+C1SVt+lZ0LQmoCewJQ6jIuQH8ok82nJIvqSZicONwvZOmk1Ut3IwyTAts8hsLto2hjcGybIcqLcBipOGu0yRCN0g2hhTkCXyOY0XkKZMJlOhN2PGYCeJwYTwQ1/sL3931elKA</Encrypted>]]>
        &AfterUpdate;
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuxDsx9eurnVcIgWRMgOPSflXFqh0+HYixRtKZ9nle1HhNDXNE/TcRjkBrKXMwAIqDg==</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTLuRqas6Nx6jSt96pJBFnPKiRri05JUVdWzS4Q0lZD+MSC9wNCFiguUKeOcywDrlzAJlb0p0nxNu9Zclv4GnDUyGL7TxMQUws3u41LMkHN68qnDn1OuvbtRg7cWv2rJvgCwCy7NUjRJJzRYY1RQvXH+S0fDhUMCe8ihkK7qqUsz2LX/j5qbv+900JlpMfhbNJd5rT8pJbepEGiA0S2uD6L7yjQeY1BIS9AEhkonxnox7RM3q2xB7jisUCfj4L6o3y0hLJT7AUcYrkP5bjJ4g5QQ0nMRVDAzOJ9YXPVB5iiejjpkm4p9U7K3eazMwDar41MV3U5jI7U5HxwIGZw91C3WIUNdExh1faXNVbbvZLi6GALg4MeoGvLsDzoKX1WJr/Bxf3dq7GpcATZqGEcEI5EPc6Q0znP63Utnk8XM53HUyVQj54XFpapTKxyRUVx87XEDzgx0j2Xa2hQ2N/hNh/5sUtOc2Ke2PULeZt9lqSVtHHMXQ6mXS1MCDlbZ9P2HAV36Hxv2ffqszKN5pI6B1Sb7LF//G2hf6dWLiDmF7ubl1QnBdIUXGnBfsvwbyFX7Ox8UeyzErx5+nVAKdYJ3HXYCQERfrv/zhVjkiv0bJPYzbi8yJ7Ru3BZjwIlUcJ/i4K3X+ycW9UyyzW0ZNyARRfloXh+3sA7MF/M13eUSUE96I67s5FLxytGjFFhIG/WSsgf4qXv1HcWuLxfQgrDMsmKJRGGynl8zCglMXL4MMO0wWxVhVWVBxWR0KKFOVIl9ZXEjJc+NMsSYTgJIvkLPNMH75XNcwNW2L2ZbOnvvJV0ftP2fGWiO1MYEzQV5lzhvp5/ROzUIRQlVIaWECBFSBnYk=</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptIrregular;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXbzgTDXl7qaI8O5xXacVJrmNS/MJEdsK1yG4u4ZIWMkET4uNSOkANqY6v3zUEAlO54cUWzudh/Sonvk+bpQOwROktE9a9OWJ+3+nu+NHLKuXc9nK5i8StW09Pb1pqfjulKkL0FHHxpqxc2QjPxLe1T9CKKsZrXOlOgrHPw9h2z7c7DePIbY9u9pjQvOnn3E6MT4Gi3CgbuVQZzLbJMPcs6ztSmDOD2pX45ZV6K1rNZ7FNVg03c6U1g4CyNsWrTdof6MkdgW2qxKfUqbYL4CtjhUglBJBW845srDmwzDNE9Xd27nda/1iu1XSi3cLqvJB+gFsfsVh3TsIbgE3E5Brmpm1ap3QTFt2DkyhI4Fyfh6EVZP1U/GdFtdQyJRzmW6vvmxRAIRbkaBgYvrwYxSD61cB2xHdzV63iuVmQZyftmUX9k0ZOBLcohGJYa8FMrRnA==</Encrypted>]]>
    </text>
  </script>
</dir>