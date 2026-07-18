<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="hrdmldtca" code="ma_ly_do" order="ma_ly_do" xmlns="urn:schemas-fast-com:data-dir">
  <title v="lý do tăng ca" e="Overtime Reason"></title>
  <fields>
    <field name="ma_ly_do" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã lý do" e="Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="ten_ly_do" allowNulls="false">
      <header v="Tên lý do" e="Description"></header>
    </field>
    <field name="ten_ly_do2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="9">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="110: [ma_ly_do].Label, [ma_ly_do]"/>
      <item value="1100: [ten_ly_do].Label, [ten_ly_do]"/>
      <item value="1100: [ten_ly_do2].Label, [ten_ly_do2]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf/ps/DM9qzHRIV+N35eeNoBPp7S6RdT22NsYf7jUUEfhcNRqO+y+pFdQkwHPu82pt2gTfcWYjU7c35kKXkCVpFPwyGrspMoHv5SsRyCWY+ld</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf8mt9ES76uOpCO98F3f8FilbnviQAQYb7Zv+IiPkL/dGC5XO7MrA6kyx7liv2z1dYjUF9iAEhBprnS5IL7XXCW4=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliBGSFEJsrtTKjt6qIjhgexGjSL9hU9m3aOTf7tnGkWXgdLtGNZdI7FpHu15s1eellM3cBUb1kIQEeV81K/vZdyYet5cKjtyGi9alVZ2Nq6Ubpq0limbXsdiPwaKzGbUq82sN3CGi64g7a7xDQBoYzhSThTiBnPVRSm4PcW2wYfbSXonq+8vpt+NEdTlB/Z0OhOUS3fwtKKOKaABseJ5A7pJy46qSC4foHjVSwmJ8Gx10OOsMnVPJfhMXw4Zq20JVauv3UgpPYE8RhDR6M+hbM/dU2aRQkanmHQXe74Jx+mIKdsgCjG+ec6O+7VyAppcFXsNbe0Oe9JVukBnEV6RElpw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nwOr0R5VOCABly85KP0BAfxRMdogd5ZaEsM7qWcwnvr7aWzP1fymhqy3URIO+0JhuJnBWpEs74G/gxFWgbFe+BZC8HL3vw9uH0HkolzjAIhX2frHH4+0rWD3xNTdet35Nz5E2MctZRkypD7ZTvlVylTQA68wznlUZZQkzBlRU8Ql/2P6DbKeNzEkgaYKaRFTnFHot5cPWmoLVhID9YIi946Y6IBPWVKM+QxIdu2ulafA=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/ja14e+3DGOpTPl5ZQCkyjWkxZL0rBmtMgPS8grMAQhmbDCH3naMyqPF8O/6s8dWjP2frQCruZjXiarlFIemejhvHoPWs2ORcZDJ0SKm1Liu0xmvocsn2jc2aJgQkKdV9elXM527/cFYwHcJgtsejrw7ZExf33FTYOmfwte87L42U7BdWS7rY6O1KSPnFZ27E1yrKsTEm++Vd5uUlDUWaO+eSwvcL+zB3FI1sqO+VVnHy8FLXCBGzV8eZPhgkH1ZNDRcmokI6ta1GZqPGhpsHoqg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeifVgXSDJ/FY3SARCAlb9I+vIJfIJTt5f/MMead8dkkl</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70BeSDFbuVcrQhb3UkKH7mMDhuHW+tKnzT22fEnSvC96GL0SUHvagkUTkaJwYvIpYHOgAspMLyStQmRIZ1FyvRRQfzaa+diRq4SL9P9PpuNn52av4WwwgN0OBxo8pe3biuN6R0gDGNOIbuFk58Rl8PdX1/y9Sk/O24C6O27lQVG47Y1YvIXCmXMhHydQoTVnrxdljtP5XoZtzn5sIi7FJsDNRazVBnpj1CUPf2akfPb/dGP5/x/epVCNmL7eaqHxpPKhasYflXnht84hMQZ+MC/mQyn71ey9S1FRvxbiDkSYmrx3FrUlrGA206LrNZsN+5CHE8ebEq+HgLLSpW6Qd/2S1VMxjfctqAbw5HnjLUiSB</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

</dir>