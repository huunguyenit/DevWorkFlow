<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir table="hrdmpc" code="ma_pc" order="ma_pc" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phụ cấp" e="Allowance"></title>
  <fields>
    <field name="ma_pc" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã phụ cấp" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_pc" allowNulls="false">
      <header v="Tên phụ cấp" e="Description"></header>
    </field>
    <field name="ten_pc2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="ten_ngan" categoryIndex="1">
      <header v="Tên ngắn" e="Short Name"></header>
    </field>
    <field name="ten_ngan2" categoryIndex="1">
      <header v="Tên ngắn khác" e="Other Short Name"></header>
    </field>
    <field name="loai_pc" clientDefault="Default" allowNulls="false" categoryIndex="1">
      <header v="Loại phụ cấp" e="Type"></header>
      <items style="AutoComplete" controller="hrAllowanceType" reference="ten_loai%l" key="status = '1'" check="1=1" information="ma_loai$hrdmloaipc.ten_loai%l"/>
    </field>
    <field name="ten_loai%l" readOnly="true" clientDefault="Default" external="true" defaultValue="''" categoryIndex="1">
      <header v="" e=""></header>
    </field>

    <field name="kieu_pc" dataFormatString="1, 2" clientDefault="1" align="right" categoryIndex="1">
      <header v="Kiểu phụ cấp" e="Kind"></header>
      <footer v="1 - Phụ cấp chung, 2 - Phụ cấp chi tiết" e="1 - General, 2 - Detail"></footer>
      <items style="Mask"/>
    </field>

    <field name="tinh_chat" dataFormatString="1, 0" clientDefault="1" align="right" categoryIndex="1">
      <header v="Tính theo ngày công" e="Dependent"></header>
      <footer v="0 - Không, 1 - Có" e="0 - No, 1 - Dependent on Working Day"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZRjosQDFR5gWKjHvm4XvGUvXaiAp5kD0rMAtUH+b7IXyprUslJd/7NbZY/ZHQOH15Q==</encrypted>]]></clientScript>
    </field>
    <field name="ds_ma_cong" categoryIndex="1">
      <header v="Danh sách mã công" e="List Workday"></header>
      <items style="Lookup" controller="hrWorkday" key="status = '1'" check="'1' = '1'"/>
    </field>

    <field name="ty_le" type="Decimal" dataFormatString="#0.00" categoryIndex="1">
      <header v="Tỷ lệ lcb (%)" e="Base Salary Rate (%)"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Tiền phụ cấp" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="stt" type="Decimal" dataFormatString="###0" defaultValue="0" categoryIndex="9">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="9">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>

    <field name="hrdmpcct" external="true" clientDefault="0" defaultValue="0" rows="148" filterSource="Tidy" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Phụ cấp chung" e="Allowance"></label >
      <items style="Grid" controller="hrAllowanceListDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_pc, ma_pc" e="String: ma_pc, ma_pc"></text>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="208" anchor="5">
      <item value="120, 30, 20, 50, 200, 130"/>
      <item value="1100--: [ma_pc].Label, [ma_pc]"/>
      <item value="110000: [ten_pc].Label, [ten_pc]"/>
      <item value="110000: [ten_pc2].Label, [ten_pc2]"/>

      <item value="1100: [ten_ngan].Label, [ten_ngan]"/>
      <item value="1100: [ten_ngan2].Label, [ten_ngan2]"/>
      <item value="110010: [loai_pc].Label, [loai_pc], [ten_loai%l]"/>
      <item value="111000: [kieu_pc].Label, [kieu_pc], [kieu_pc].Description"/>
      <item value="111000: [tinh_chat].Label, [tinh_chat], [tinh_chat].Description"/>
      <item value="11000: [ds_ma_cong].Label, [ds_ma_cong]"/>

      <item value="1100: [ty_le].Label, [ty_le]"/>
      <item value="1100: [tien].Label, [tien]"/>

      <item value="1100: [stt].Label, [stt]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>

      <item value="1: [hrdmpcct]"/>

      <categories>
        <category index="1" columns="120, 30, 20, 50, 200, 130" anchor="5">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="569" anchor="1">
          <header v="Phụ cấp chung" e="Allowance"/>
        </category>
        <category index="9" columns="120, 30, 20, 50, 200, 130">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf9EA73KXAz472j8BxCRLPsutHIoFVcTzxJjT+U/flycrS3FQ707dB5EWlT1Ry6IZnIOwysDyBDM7JmQ4A+5boaI=</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxWw5zhYqunaFc1aSz7WLZhBqfSl5v4PHbIEXaWHvBBOEpZ+mX6LS6yMvYVOEztGO0elEMYRDQbeyc+2Ja3FdWdX0Ksmyt0I1tVjTtWKtWJq</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1MpVFDKK00MnirxsgsajDdLrZ7ZkA73H8PN2vWKF48K6FJKgDa6OcN6oKneELGqpeZs+ozSbpi6WN205wmNDi4=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8DXeeCi+ES4uYv5Q4DQ/vZaWddXCI7PWaotKgYu9/5x3oPW/cdNvYTpnxJYnWRCkGs3LipiwHlWCFLCQa1S26QcouxuwCNSv9LJumkQ/bCl7fmMineqUgcpwd3ciMPYVZigobrmM7ypyaGgK7TH+qb6QrVHmVr6bQRPLeVlPITE5n6X5G+XxIaYTjs6CDN/4FQF9UuKFBarnFnBVC4Ar1Im7eKcgMl42Tc2JukXTJPybqiY8Dpie/upGphHW/z8VBc7GznfJOmEVDd0bI382ja4x+9L+b8c4VUbOgzpCN42HBcIVikq5eXnVJYD+tomMjFeozyz3RJS5MHJwAzR6ZjLHIGpjfOWxqAlQgfvd7pGD5CQwgJXlD2S73Q7UIJi/K6RqhjkNmpZhIPG5+kLpbkUYirr1MbnjJIrTp0GtfbQ/8x7DHgKlmKf6WefODn27al5bBWHq01mqZyCoMhkpcXxbHAMZVR9QX9pTlZ5x3umKj9nrCpmxAAoWJdq+9bQni7zT4juXrd5G25+UIaTWhQrGd2XA5hTvxRntlrJKugMjQ=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82narBgh1Qo421e8/NQVsBuMpeRLYRGnWN/q7dThZTT0fY8P2vLkwB2eLqPgkW40mHJUuBS6rfsofedVTDVZzI7Ti+dja58Sb5rFqYNaZcFYTGlJ9pzp4tuFtOhffIbMv83oSNShBXvQbzwSDT1p1oUeHFh4hGZZ7W6uYh4OsWNe+HeelLSD6crS4VnxkahNBGlbbgMa0MsErzwTm7GOU7/bItlLfeMzWuvmH0ho0rE8mDM1OsCGCbugBC2WqM26Lf/</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%d+akOGCR5x9eAL6ddFmzcTypxmHvC7WgLiPsY1wCu5Sa8A7+5Ydf0XdlVkiTcdoPLdmsONQZ1pSnN3wBJjqiKQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jEpX0T9FpC1noNGUFpEx3jq51PqgGGW6Z7QHhmPDzdw5W42jW+KkehUqxZ5c+r1TtpdLiUQVzrpU0RUxYuiqChXVkc/aaYRPzAKZO2FZlwKnXch1PDMnBJlnI/5xseFi35iHxdv3SHSBIp+lrf0vCa7Hmi3dW7kXi7ZRxs00VuRRz2X0yanNeuw9UpPB8E0XNHNLI06cpFWRGAqtQkDg1l3Z3lDia3kDrVgMjLRA78pEDZVqyqGm9389ZJfZWwJHr0tuvSzG3Zdfxz1wM3HS2opWV8ZIvAWzUpbiCkOegxIw9eWLeKtA8bS1gThJ3y5G0xaPrba3pDR9ZOK0hJXNytqqk8179TUDOAztg5Jhz4PBet1ufXMGfN41iOk4o5SKTyy7JrJjFBgEZ4Bofw+zqXqaMN/h78hkHKkdOrA/4WXPMdelqXhTZPIy5SfvYfGBocDOXyPWdRgUnMpY86DAHjngn/vl8YOrgYlqrhLplYXb4KSo7DxAyUNmzDJJdx0qK</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6XWX5IpNlTtfO+BXXBEueKGtKO+DwEHjfxBtpI05vw6HILIlP7ogkpWyZvlFB2E7hgL/zhSawJPbgYkgdwJUCZYnYM+yCCTNb14BqzZpAkSFvBlL0XXu1fr4FqNOCIODoZWslwnAswCOgxS9LEpUX3rGDfJfCNB8Tyv5YLgzXog8Xt9T0yjgbjks7fGD5Ef1w==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3VneU8wd5Pa2T6yP6kVFAkQf7GknwbojjbpCJ9rirngJOsU31RjIuGEpQuL11EK9DTfjQRfXobRP42or5mKaroGXJRxnRSjZSWvP/RFfJrNjjHrL8fbYi5ew4I7MEs4F6XwpaLL6ZlDMw/+pb0J/yShe0f4vFkHwrLus3s9cVoHf1hy+m6GW9OJT4ijrndceCsQnbMXMiUDzncsInO9wc4=</encrypted>]]>
      </text>
    </command>
    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KInAnqcXJOY1YJQqLL4krjp509zGCV032qaGuLa611h40o3EdqBu+lGqoSCdXv3SDOqymz6LXhq3Vg4M1dzYJ3WZdQuRwm3QN1lD/ojgCiv32VxOuAGiiQ3AokERoryDmmzezUHLAt15gwjhjHZjtUiMsr+T1jb9Ru2RSWHq/Kt1oHBl61s6yZhYzlv+9E0IVU1MpyFnUtOSW6dJDgykI9fvwC6B55gVXf0m0HQQAeK/8fHRrLNdtKml8SeW9ZnGvDjgkbdwT3cwQvwM1oNHjMKqR9/XCYc6DRQ/uSjfVdqJrReGGwSdqSSCp9dRHxi68jNu5qrEQrl0VPZDZFxz5ZJpsTt3TCn/Gj7bPpkan5P94Y37aDeB/9e/k6KEIgi8tIZGYbVGrj9PO+vYanFBu8ArFWTFrjnaUPqMbyTvOqhSFT/J0Ja0XNCn1PNL3wGgtJVkzj6m3xe4I2PVWkbobsejDi8dw/BTje8nHAyLeJvR/YJtLPnImBx75K5iMLHE3d65AdjklLXiHHyb4v1t4jug6AxBjWYY3lcFd0D1IPou4grmElMR3VKlRHaFetX8vBV1CnEOPsgQZ6clzBwryueQHV+BgvtUCS9UCPFfpL2HE0sJ66uSXuUOvcalpIZTEQTyQH9h6GHx9tI2RamEqOcGntpgt4T4zTzlKue2QGxPVoyMpGdP/OzV+C69CJLRA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70I8cKshdMVFC4j1XKHyCocP0Q8cNuRnucBGyxZaP8id44yxfZRVCZal5KZdI3ok0DuNsMtlrPKJHi8a279x4RTx81Rt7htfSp4WXADctVVvPQtROjVXQ1S4Q6/yF3gabQHS/ezpwWcUvwQfc9hdKLR1K1TU7qSvXtCTCubUNNrPaUrwSyJx1EfZYIuOKlzS3iaqZhWV8bWacJknxf9ERoPaTo3T8vNE+zhP/VtOy6Xabnaokcn0GsWC3XZCpHXKZxJffCm7lFCAkksKsjT8BHEnA/UdHzMxhw3VCe9nzRGlk8qzHpQtn962fxrQu8MCDJEW7cUIXkgA9VsKEK2PuFez+TVlJ/Dd9bVM/F0A1cSb2pKocstTQa1vszJlMu8iUxDBf/+Xt0uuHXmp/4OeEbAwku0fQRu88V9CZ2No9jwmdO7BHeHh1uB7SXCLvGXdbLt8bcUUEVAUWoVXH3KFxU9pWz24Z2MNb4yC0511vz0uszH1L8KzUDaMzsp2cJGrj3W7QHlXoTi+9y+qDiRaZMhNjYhKN4LG/+QY9EadoCGIiP6GE8j/zR1MB7fHupe6XsRHpMZkoysUzV1lLsgrmgAtpzMaOuNJWNWw/Gpu2iTcd5E9EG5zkTVf7K2k3hiAa2/TwM1AEtzdK64NbhtCS/BCrnp5LEiT7+Hc0iqAh8IsvJ22MAwdsPFxluRWrHKASVr9EFL7PuQ4hLs5qfYw2N4CzpwbsxuVnOmHm4o7LYM471w3yLbHsbPxa/VlRKxh11wmAiYbd45xDTtIn/3W0lql1bhyob7eStaUR+LjawPaawEoRvt23PbqPkvUEyQigjJALCdWUQEvAUIFQQcPCAlGqiTUYt7tdkk1q0l3BK9a5U0PaykXYV3dB34Wfj9RV/UcgBqb6qJuWiTloAdDEsFntRUxOLtT3PEfVBtV1gy5EPSu/ZQ17Dt0iBKdmmSincsFYd6mnD5s1SwMrBOCcNAm5eRUqrWHKF9YQzUlsUtlsxIhz+FxdiFYmzZLm6LSgmg5i6nNDJdFr5L+BQzLKAy5poGIRn5Tp1liKyPm/jEDlyoFdUCVw9RaAZv16AP8TwbJ2zYBTSPbDGC+gbz38uwmTaxLc8Z41ftxUYysNqdnkzPreXwWKIaoaYPDzuQTGVLOHI+0r5Rq541tcmM77/scR1NvfPFspP/9SnQeCHhKFVKPSC1BvjRC+PedFLX+bFX03gruKnDSwO06Q/m91XFiFQ+D7BXrv+qqYU8XJMxh8wYHeeL6CLCqpgSs/4Ktt1Q==</encrypted>]]>
      &ScriptIrregular;
      &ScriptQueryData;
    </text>
  </script>
</dir>