<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">

  <!ENTITY defaultTable "GLTCPT11">
  <!ENTITY defaultForm "GLTCPT11">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="periodFrom" allowNulls="false" type="Decimal" dataFormatString="#0">
      <header v="Từ kỳ" e="From Period"></header>
      <footer v="Từ kỳ/năm" e="From Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="yearFrom" allowNulls="false" type="Decimal" dataFormatString="###0">
      <header v="Từ năm" e="From Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="periodTo" allowNulls="false" type="Decimal" dataFormatString="#0">
      <header v="Đến kỳ" e="To Period"></header>
      <footer v="Đến kỳ/năm" e="To Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="yearTo" allowNulls="false" type="Decimal" dataFormatString="###0">
      <header v="Đến năm" e="To Year"></header>
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

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="(@@admin = 1) or (ma_dvcs in (select rtrim(a.ma_dvcs) as ma_dvcs from dmdvcs a join sysunitrights b on a.ma_dvcs = b.ma_dvcs where a.status = '1' and b.user_id = (select top 1 id from vsysuserinfo where name in(select name from vsysuserinfo where id = @@userID)) and (r_access = 1)))" check="(@@admin = 1) or (ma_dvcs in (select rtrim(a.ma_dvcs) as ma_dvcs from dmdvcs a join sysunitrights b on a.ma_dvcs = b.ma_dvcs where a.status = '1' and b.user_id = (select top 1 id from vsysuserinfo where name in(select name from vsysuserinfo where id = @@userID)) and (r_access = 1)))"/>
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
      <item value="111----: [periodFrom].Description, [periodFrom], [yearFrom]"/>
      <item value="111----: [periodTo].Description, [periodTo], [yearTo]"/>
      <item value="111000: [ke_hoach].Label, [ke_hoach], [ke_hoach].Description"/>
      <item value="111000: [binh_quan].Label, [binh_quan], [binh_quan].Description"/>
      <item value="111000: [cty_khac].Label, [cty_khac], [cty_khac].Description"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [form].Label, [form]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsDCzDTbAYjxedDUkYV9a1omgMm+cPs69mQwYzgY3h4nm01Vlkt0i7ZN4aRatfJtsDQn3rKtCc97AlUK5bm5uQIgRsqCwntXP0WJGnqD/KX1yf6jhaytSurzqZp3cYgi1qhMOR+RFr1RxqqMoDaJbXwmtryCQiXj0VNE6R7IHguYtAZj/MMQU6xtNpMs8dPekKp3JMGdTArcunRzLPCSJl6k</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR77vgMbfRI3e6BDGxfc5Ox9TJa7T4TsH/1P2o9YkLHpmcOiY5iE76Ty6x+rKi28LDzqfAa+89aJO608ZQZIYnZH6JPOLIJr75Ii71z7sZSd27uVwqIfcqTxdkJh5W27c+5VnxWD50aqtVX/Pv6MPJlptVGM6/IgfzAFrAjvmJA20WC6pmDEeh/j0i40IlAoUbCNlIIT72aMgv6Le8ewn+wysVcILc0V2oaIihBo+i+D9e</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAA2yLSlHLMIpNRbXv95PEzLcpXyvZZ1194114mb0OWgCEAqghFPtCt9sf1NJKZ6Z7IGsIUO34HhaPzUWxwzdUXG55fpsWyykK5iMhONuUn50V4YPukOc2HH4KxmY2q+HWM3yVJX916c6vvkk21b11/aoHRulgWJX2rM6H/9z0PSluoViS3x+jgNUqtPmHXvJYcrXYNorqGTFWltDJGmmrKMkjtH+HOKkCWyhYaUUssU</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdM3UOpvSWZBBdKWouRu5rKyrIQTMT7Slu0ZC6B9TlF6yqMpJXaDvgMrIYdpITtoD555EYuzLZrQfj/N+SX3D5bJtqmow61HdLBeyip8rrHBJiXK2p7HGLytOyV4UP8QvTZ5Sh4yQhO3W14VkaueKUtmndKro+M2X6Vc42TZ2ZJj9hFfmL+0NZygmqbw55DZgqQkvu3dTASI6Dsr6vNkHYSuE3AtsVU4RWpKidqntQx9Ozd3TU3Vfj4NbiiJ/34Sw5VArZNoem1sJO3Nue0JyPQAPpazwBEh8TSX6Utmq9pQAccDgt6vjw+R2g7CxK5dQWwSM9iGXdluBGPT+BWRDJseDggeHq3mz7pWERgudRDdZi1GsGeSubJvFd8IzlCZtktETYPKluZsUBquLsu4KWvWHplu4mNLm/Yu3fUHTUEnasTPo30NmMAAw9KN/zhTL+UEUKkBfGIwpOEk9xJ47Ya0UX6lKoZJltabaLSOG1p6u9wTdk7dYWm0/YC5MfaeRgrbcbW+aPSKAONY1BPN7YzNNGZMhoCQUNZqez6YpXE2Rn32mOmswspCVCaSaKAlBXtXp9xiLqoDgQp2iPPoZLjfeTBHujN51nGrGwVQI/J91pu08ONFs1J/opsButVFmmb5iOjFl+P7SdOoMBIjr5y7z/uN/HL5ANPJqsDBPIaCYPj561SNCoXJ46IyXq0azAiEukXT0zUUuA/MduHchb+3xTOFDM0JiPyHJHBgW1ic4DcPGghhPHio8aQdqEohqPM2oA6zX3mkhpM6jJBRFWmmMz4ImcSIlfx9Dmxmz7cRZFFPoyGroeR4ZWjtlFu5ZJbag87BMWGj2/RLR4XcdTtkpF/3godHcc1j0Xr6q65u++OdTlIiPwaajQnHvG/eP29YhddtXjPNOaLF1YO3ClLRHahb6UvYb3gMJqzezLX4zZ3hAu+ukT/o94d7ZMgg78KP0Hiww1CXzDa+WdltwvAgv4XmCAO3h3DWWN6RCvgY2gXRLQWvOd1xU5u7odO9tCfGvMHWswWQyI21DgT4xFVw=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>