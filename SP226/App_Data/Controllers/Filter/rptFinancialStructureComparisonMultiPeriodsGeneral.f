<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">

  <!ENTITY defaultTable "gltcpt11th">
  <!ENTITY defaultForm "gltcpt11th">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="loai_ky" dataFormatString="1, 2, 3, 4" clientDefault="Default" defaultValue="2" align="right">
      <header v="Kiểu báo cáo" e="Report Type"></header>
      <footer v="1 - Tháng, 2 - Quý, 3 - Nửa năm, 4 - Năm" e="1 - Month, 2 - Quarter, 3 - Half a year, 4 - Year"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_ky" type="Decimal" dataFormatString="#0" clientDefault="2" allowNulls="false">
      <header v="Số kỳ báo cáo" e="No. of Periods"></header>
      <items style="Numeric"></items>
    </field>
    <field name="periodFrom" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Từ kỳ" e="From Period"></header>
      <footer v="Từ kỳ/năm" e="From Period/Year"/>
      <items style="Numeric"></items>
    </field>
    <field name="yearFrom" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Từ năm" e="From Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="ke_hoach" type="Boolean" clientDefault="1">
      <header v="So sánh với" e="Compare with"></header>
      <footer v="Kế hoạch" e="Plan"></footer>
      <items style="CheckBox"></items>
    </field>
    <field name="binh_quan" type="Boolean">
      <header v="" e=""></header>
      <footer v="Bình quân ngành" e="Branch Average"></footer>
      <items style="CheckBox"></items>
    </field>
    <field name="cty_khac" type="Boolean">
      <header v="" e=""></header>
      <footer v="Công ty khác" e="Other Entity"></footer>
      <items style="CheckBox"></items>
    </field>

    <field name="form" allowNulls="false">
      <header v="Chọn báo cáo" e="Select Report"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList" >
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="1110000: [loai_ky].Label, [loai_ky], [loai_ky].Description"/>
      <item value="11: [so_ky].Label, [so_ky]"/>
      <item value="111----: [periodFrom].Description, [periodFrom], [yearFrom]"/>
      <item value="111000: [ke_hoach].Label, [ke_hoach], [ke_hoach].Description"/>
      <item value="111000: [binh_quan].Label, [binh_quan], [binh_quan].Description"/>
      <item value="111000: [cty_khac].Label, [cty_khac], [cty_khac].Description"/>
      <item value="110000-: [form].Label, [form]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsDCzDTbAYjxedDUkYV9a1omgMm+cPs69mQwYzgY3h4nm01Vlkt0i7ZN4aRatfJtsDQn3rKtCc97AlUK5bm5uQIgrIJPOaPIZ+z63f3sdcWm2XBiS2OMPrmO/HZtrlxXovNPoGupmuZmPE51NlEpMpKsAbRLGCfcTjqr4MZSMbO/kqt8PVSDByzHG9aXC1/xKzE=</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR77vgMbfRI3e6BDGxfc5Ox9TJa7T4TsH/1P2o9YkLHpmcOiY5iE76Ty6x+rKi28LDzqfAa+89aJO608ZQZIYnZH6JPOLIJr75Ii71z7sZSd27uVwqIfcqTxdkJh5W27c+5VnxWD50aqtVX/Pv6MPJlptVGM6/IgfzAFrAjvmJA20WC6pmDEeh/j0i40IlAoUbCNlIIT72aMgv6Le8ewn+wysVcILc0V2oaIihBo+i+D9e</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAA2yLSlHLMIpNRbXv95PEyKp7NUoAO7TecIfCzQKNXKt7A3kYmOA+PuoUgWBVl4d66MIsXN1zCykXAkSK+zapkpbGg0WRWY3H1TKnIzj4wRAQLbKfegc2ORW0u33w/n2BlwA0DyIXFWV1OX3L0/+aY3duCO9aaD7sM5lZ9Eipl5bd5bA8wB7ntOEjOMdWR5LmKDa0hP6NdiLmeJS2QNCEoUIUGuxa4Wf7OdNv1ev4l3ynwgjsAmCkzXz4kyTewbSR4szBOtprJfwGN+4WYIpxtutrSs+hQ3RsW4O5wecli/W4MKn1rgXskiZ01sgImbCWtzf8incKaxKFpLGnwhMQKOrDJXR1+Oc4LNculAMq4ttRJKMEikLFgfn8FnAzI4zU6QvJenYUTJ79lXUPYD2dQ=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdM3UOpvSWZBBdKWouRu5rKyrIQTMT7Slu0ZC6B9TlF6yqMpJXaDvgMrIYdpITtoD555EYuzLZrQfj/N+SX3D5bLrzBnBmf98JtiHIidl/XKOr46CVEJLi6emH2ifc54j0O4m6Eu7Au/esDROOrJJeIl/iBzxJib9Pfqgb6n9UOxk4rEnoeAcz8xyWfwlh01x/FCUNWm7NJ82zcc7XYfj4TxNImCp5EkuL7bcObvHVAp7r6126jsIVll1conup1MXN0fvf8njAtVDR1JkN1zu48/Z48GWiigq0rO3xx4A/Vn1EcnOXprrY/3/7aON4Aa7l4zrxQmIySyByk9z92qksKRyxrPFol6XW2s4GyrLk9DXz4IxMws2BMbjs1+vcSlICm0vWeLsi7Cf7PAFSBATFjFE/W6ib8zzLsgoKPUC9qNet1m4lGb7etN1dH8NIDiB/8QTneMBzAWJ5CM79J1ZKTnC4WqdYKOla1jtbY/c63olaJsIdhblJLchnFGxytAtqyAeuWAHpvWVoViOiW4lwsk0hWeywQQo8f8EFJEuqjV41t0RS1ueLqmNA1PMjBU/nQr48e9GSqDJppK6JxnTNuCd4c0az5VvzEeD2L+z12K8ikx9p68an/3TCNpQRqlP6CzKzmV9BM45FrkOwFeLxWeLjSV/jRtJsufNzeSc08978AV5zuwWpsZ8PJXxA9G5eYC+TmFFtX1LWnK7DsZIeD2a7L9sIDeGNFygukanl0NyEnQEWpNOYOCz0PSn/PiMqFeCoJ2p8wLaqnBjGBCz8RzNgwcltS0jT3RC63vSx2nBN1nFt6ywOXx0ksYki3i/zKz5UHxhexbNn0tbyWNZvaSVc7KaHxZa7+G+9RUG5ZVewcALKaWn7xSsl+wdRvQnr8pJQenATlUkDqvQ6aneAMQvmGM3BBKv0SmiEwzlfzfxXWV2x634rBd4xK0iQKJZouPME4VjvPBjSveLBrSVNDbbktsKesYqJs1gaj8G4Ki+NveAd21RPY/YW6MGTLcOO+8g2SxGUqEMW0EyPtN+RBjKSh8q+8SaGa3YnhVOMMgS</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>