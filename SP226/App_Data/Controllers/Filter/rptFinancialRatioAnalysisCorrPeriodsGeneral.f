<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">

  <!ENTITY defaultTable "gltcpt01th">
  <!ENTITY defaultForm "gltcpt01th">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="so_ky" type="Int16" dataFormatString="#0" clientDefault="Default" defaultValue="3" allowNulls="false">
      <header v="Số năm phân tích" e="No. of Years"></header>
      <items style="Numeric"></items>
    </field>
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
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
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
      <item value="11-----: [so_ky].Label, [so_ky]"/>
      <item value="111----: [periodFrom].Description, [periodFrom], [yearFrom]"/>
      <item value="111----: [periodTo].Description, [periodTo], [yearTo]"/>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMAvnCxto/MUZDZ/wBDm/bGWF6W6paNYxg4b/cwrrnRjAmpjgXzGxKD+HEOD5P041gyOazy8aiNfJlNKC/qWMCBX8WmIseD569MM8R9MVeByEBlq2g4MGid4QKtH8ZIf889n0L/sqgyN/ae1Vz3L9aFBNe64NNA6bWof/LlnWUejbdBx7R7ZEPj9DEj7Mu8p9aweOrQ24m5qQ/tNACb5Sr0=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdM3UOpvSWZBBdKWouRu5rKyrIQTMT7Slu0ZC6B9TlF6yqMpJXaDvgMrIYdpITtoD555EYuzLZrQfj/N+SX3D5bJtqmow61HdLBeyip8rrHBJiXK2p7HGLytOyV4UP8QvTZ5Sh4yQhO3W14VkaueKUtlYpmHvoBx9HCtieDaXmtONID3k7TLwdRJZ8QYFtLYQaP9v/eRmCAwUb/u7Ak3xealVnNj/G/T3XsuvlzcreTIobA7YY+VRsBZCre0a/DXTeoHrg786Tll+8YEjf6zjM0Zm/01mue6C4EC0/PhPlxu0gP7WgebJS/OnwpdVRapquiYPjjxypS77cvUYytmkO6v0dSvldBx8rWlllph/U3Ix55TCILX/+yAKJqupKjY88vvqOO2kEpULkRRgK3NyseRCrKmk4xACi6+B+sf2aCn/Iy8dkciF5jnaNAB9LkqFJNd7KZ976Ui5XR2+nZa/3Pmus8waUpUTAJyxvOjHsBza2hz8gTtBuzTLMPQaATUu6XEyu9NCE8JSkHqBRFJWooKLtYrCNLLZD5/MADu38k7c5J04o0zvQRXs3Q83sQXclhZ+6hRFYev/yIQhikWLoTTrKxbmfSW2XBBO2wnOgoAdeulr+sB4luwjBUEDFyQRp2JFSgCygoE/GgZ4mnqLb8xbhQK4GxAws5Klfq4qBcRz2lZVBlMlvYMeb3euP4RnrVzbFKr9jWtEgcuNUYNi3iZk8G48gtoHslJ9+Hwa9SC38zgdGPTjaMJDXbIlW2+bI8GBLdUj0y1Fan20GpFwyeo=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>