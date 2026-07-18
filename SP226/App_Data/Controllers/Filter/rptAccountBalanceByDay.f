<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="tk" allowNulls="false" clientDefault="111">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" normal="true" key="status = '1'" check="1 = 1" row ="1"/>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing" >
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2uVBFN2DxkVt19BLlNRoiq1RzK7OTbikTlGNkc6Pyfdbx/rUxet++RWQpuQLXKbxUcd3Zh9PAJWUYJIbFjiPGpZ/cbi4siUmrAHnXC0MvurVK21Bn+LjqIH1UIttDot9ohwht705NJCZfrcCKdFlVWa+XJwPWFvLUEUdKuEydTEPFxeqXqdpUrlgWHY12i+vKw5+HaKGit88XTmcY9mthZzliploaX49dbeQ3G7oSmM0cmmqfPjvizTmWdACN5JNBRBtU5JE+FlmLZvrypxtyQTOQvo0O8vtWfpykcS4Xmu</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1KzovGjX8PqAdTr/BMqZOmhD21/kcC4L+SaJqqrhB5BWWvZL9ud38/F4FoVNsFtwoIezr32qRPjDQRKQrSED5B5LSiTQgHGg04u4Jc8em0NfZtMVz+aoicqI+mS+yhdbF/ycNtxqfy/xiwq+kfb9leVw2u5OKZA9kbc7kuOnx7olv+ROHAx9PbCEP8NkqLRTrhDi0vj99Du/FfX4A+rsxursuVnBlu3zJBt+Uw/eJtrXwQRHtYNHtlmLjOFJGgjwDDBTzdrO4hvN0VNIZQSRgmf53cYNhqwYo6VmF1TNIwbv/wQOImfVW9vlH9yhTyHNDB5pV1+FTwK8lVNKtSOreBL5J8ds499koE3Jdu/xFnNIzd4Hz0WmKiMO7uhO0Hrc98ZNKv3OVr1RO+7Rg3PlQBsElbT/7xZ2m1QQIYOtuatvVRlyAkMdVVJRHLfTlzC3guzRN6KiuzCPshfr0ftrk8cMxtxrhTtDwd/bSQdDDJnr6vh69g8+XA7tkEwoztYFMZeNZFAYBc9pOBWea9Udyw1Ew0b6Cml/o+g28LO8Qy+VDETF2XE8QZuULWgOooGN4GRhDrJwbACIhJaYvxaksLEaWoSqXLJ88kI4LtUrpRgGxntVaFk38ZXqfRzMG9lFfwIWbLhOVEAsNcXLbAUMlwdpdvzXRcy82MJws2UdW4dHYetrY1Yjm+AyVsL+ybf1pY3UqgsOiamvo4gJEcvCHDRFccNDIu6fcgnYTnTaEYARuZ</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifiyQBkdvDG95EJTEdIt66OvFJinP2Kyzj3jT0QRsptEMoOdMYZ4n2xjB4ZTbHxrFOJ7E2YHZzAwWwiv1Vm+oEYmFMRfmjwsOch1YJG7ACq9tpqQFgz5u6/kAWqF93OoaE=</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>