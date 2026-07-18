<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid type="Report" valid="stt_rec &lt;&gt; ''" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng chấm công" e="Timesheet"></title>
  <subTitle v="Từ ngày %d1 đến ngày %d2, %s..." e="Date from %d1 to %d2, %s..."></subTitle>

  <fields>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt" type="Int16" width="60" dataFormatString="#####" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>
    <field name="ma_nv" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_ten_nv" width="150" allowSorting="true" allowFilter="true">
      <header v="Họ và tên" e="Employee Full Name"></header>
    </field>
    <field name="n01" width="50" allowFilter="true">
      <header v="1" e="1"></header>
    </field>
    <field name="n02" width="50" allowFilter="true">
      <header v="2" e="2"></header>
    </field>
    <field name="n03" width="50" allowFilter="true">
      <header v="3" e="3"></header>
    </field>
    <field name="n04" width="50" allowFilter="true">
      <header v="4" e="4"></header>
    </field>
    <field name="n05" width="50" allowFilter="true">
      <header v="5" e="5"></header>
    </field>
    <field name="n06" width="50" allowFilter="true">
      <header v="6" e="6"></header>
    </field>
    <field name="n07" width="50" allowFilter="true">
      <header v="7" e="7"></header>
    </field>
    <field name="n08" width="50" allowFilter="true">
      <header v="8" e="8"></header>
    </field>
    <field name="n09" width="50" allowFilter="true">
      <header v="9" e="9"></header>
    </field>
    <field name="n10" width="50" allowFilter="true">
      <header v="10" e="10"></header>
    </field>
    <field name="n11" width="50" allowFilter="true">
      <header v="11" e="11"></header>
    </field>
    <field name="n12" width="50" allowFilter="true">
      <header v="12" e="12"></header>
    </field>
    <field name="n13" width="50" allowFilter="true">
      <header v="13" e="13"></header>
    </field>
    <field name="n14" width="50" allowFilter="true">
      <header v="14" e="14"></header>
    </field>
    <field name="n15" width="50" allowFilter="true">
      <header v="15" e="15"></header>
    </field>
    <field name="n16" width="50" allowFilter="true">
      <header v="16" e="16"></header>
    </field>
    <field name="n17" width="50" allowFilter="true">
      <header v="17" e="17"></header>
    </field>
    <field name="n18" width="50" allowFilter="true">
      <header v="18" e="18"></header>
    </field>
    <field name="n19" width="50" allowFilter="true">
      <header v="19" e="19"></header>
    </field>
    <field name="n20" width="50" allowFilter="true">
      <header v="20" e="20"></header>
    </field>
    <field name="n21" width="50" allowFilter="true">
      <header v="21" e="21"></header>
    </field>
    <field name="n22" width="50" allowFilter="true">
      <header v="22" e="22"></header>
    </field>
    <field name="n23" width="50" allowFilter="true">
      <header v="23" e="23"></header>
    </field>
    <field name="n24" width="50" allowFilter="true">
      <header v="24" e="24"></header>
    </field>
    <field name="n25" width="50" allowFilter="true">
      <header v="25" e="25"></header>
    </field>
    <field name="n26" width="50" allowFilter="true">
      <header v="26" e="26"></header>
    </field>
    <field name="n27" width="50" allowFilter="true">
      <header v="27" e="27"></header>
    </field>
    <field name="n28" width="50" allowFilter="true">
      <header v="28" e="28"></header>
    </field>
    <field name="n29" width="50" allowFilter="true">
      <header v="29" e="29"></header>
    </field>
    <field name="n30" width="50" allowFilter="true">
      <header v="30" e="30"></header>
    </field>
    <field name="n31" width="50" allowFilter="true">
      <header v="31" e="31"></header>
    </field>

    <field name="n32" width="50" allowFilter="true">
      <header v="32" e="32"></header>
    </field>
    <field name="n33" width="50" allowFilter="true">
      <header v="33" e="33"></header>
    </field>
    <field name="n34" width="50" allowFilter="true">
      <header v="34" e="34"></header>
    </field>
    <field name="n35" width="50" allowFilter="true">
      <header v="35" e="35"></header>
    </field>
    <field name="n36" width="50" allowFilter="true">
      <header v="36" e="36"></header>
    </field>
    <field name="n37" width="50" allowFilter="true">
      <header v="37" e="37"></header>
    </field>
    <field name="n38" width="50" allowFilter="true">
      <header v="38" e="38"></header>
    </field>
    <field name="n39" width="50" allowFilter="true">
      <header v="39" e="39"></header>
    </field>
    <field name="n40" width="50" allowFilter="true">
      <header v="40" e="40"></header>
    </field>

    <field name="c01" width="100" type="Decimal" dataFormatString="### ### ###.###" allowFilter="&GridReportAllowFilter.Number;">
      <header v="c01" e="c01"></header>
      <items style="Numeric"></items>
    </field>
    <field name="c02" width="100" type="Decimal" dataFormatString="### ### ###.###" allowFilter="&GridReportAllowFilter.Number;">
      <header v="c02" e="c02"></header>
      <items style="Numeric"></items>
    </field>
    <field name="c03" width="100" type="Decimal" dataFormatString="### ### ###.###" allowFilter="&GridReportAllowFilter.Number;">
      <header v="c03" e="c03"></header>
      <items style="Numeric"></items>
    </field>
    <field name="c04" width="100" type="Decimal" dataFormatString="### ### ###.###" allowFilter="&GridReportAllowFilter.Number;">
      <header v="c04" e="c04"></header>
      <items style="Numeric"></items>
    </field>
    <field name="c05" width="100" type="Decimal" dataFormatString="### ### ###.###" allowFilter="&GridReportAllowFilter.Number;">
      <header v="c05" e="c05"></header>
      <items style="Numeric"></items>
    </field>
    <field name="c06" width="100" type="Decimal" dataFormatString="### ### ###.###" allowFilter="&GridReportAllowFilter.Number;">
      <header v="c06" e="c06"></header>
      <items style="Numeric"></items>
    </field>
    <field name="c07" width="100" type="Decimal" dataFormatString="### ### ###.###" allowFilter="&GridReportAllowFilter.Number;">
      <header v="c07" e="c07"></header>
      <items style="Numeric"></items>
    </field>
    <field name="c08" width="100" type="Decimal" dataFormatString="### ### ###.###" allowFilter="&GridReportAllowFilter.Number;">
      <header v="c08" e="c08"></header>
      <items style="Numeric"></items>
    </field>
    <field name="c09" width="100" type="Decimal" dataFormatString="### ### ###.###" allowFilter="&GridReportAllowFilter.Number;">
      <header v="c09" e="c09"></header>
      <items style="Numeric"></items>
    </field>
    <field name="c10" width="100" type="Decimal" dataFormatString="### ### ###.###" allowFilter="&GridReportAllowFilter.Number;">
      <header v="c10" e="c10"></header>
      <items style="Numeric"></items>
    </field>
    <field name="c11" width="100" type="Decimal" dataFormatString="### ### ###.###" allowFilter="&GridReportAllowFilter.Number;">
      <header v="c11" e="c11"></header>
      <items style="Numeric"></items>
    </field>
    <field name="c12" width="100" type="Decimal" dataFormatString="### ### ###.###" allowFilter="&GridReportAllowFilter.Number;">
      <header v="c12" e="c12"></header>
      <items style="Numeric"></items>
    </field>
    <field name="c13" width="100" type="Decimal" dataFormatString="### ### ###.###" allowFilter="&GridReportAllowFilter.Number;">
      <header v="c13" e="c13"></header>
      <items style="Numeric"></items>
    </field>
    <field name="c14" width="100" type="Decimal" dataFormatString="### ### ###.###" allowFilter="&GridReportAllowFilter.Number;">
      <header v="c14" e="c14"></header>
      <items style="Numeric"></items>
    </field>
    <field name="c15" width="100" type="Decimal" dataFormatString="### ### ###.###" allowFilter="&GridReportAllowFilter.Number;">
      <header v="c15" e="c15"></header>
      <items style="Numeric"></items>
    </field>
    <field name="c16" width="100" type="Decimal" dataFormatString="### ### ###.###" allowFilter="&GridReportAllowFilter.Number;">
      <header v="c16" e="c16"></header>
      <items style="Numeric"></items>
    </field>
    <field name="c17" width="100" type="Decimal" dataFormatString="### ### ###.###" allowFilter="&GridReportAllowFilter.Number;">
      <header v="c17" e="c17"></header>
      <items style="Numeric"></items>
    </field>
    <field name="c18" width="100" type="Decimal" dataFormatString="### ### ###.###" allowFilter="&GridReportAllowFilter.Number;">
      <header v="c18" e="c18"></header>
      <items style="Numeric"></items>
    </field>
    <field name="c19" width="100" type="Decimal" dataFormatString="### ### ###.###" allowFilter="&GridReportAllowFilter.Number;">
      <header v="c19" e="c19"></header>
      <items style="Numeric"></items>
    </field>
    <field name="c20" width="100" type="Decimal" dataFormatString="### ### ###.###" allowFilter="&GridReportAllowFilter.Number;">
      <header v="c20" e="c20"></header>
      <items style="Numeric"></items>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="stt"/>
      <field name="ma_nv"/>
      <field name="ho_ten_nv"/>
      <field name="n01"/>
      <field name="n02"/>
      <field name="n03"/>
      <field name="n04"/>
      <field name="n05"/>
      <field name="n06"/>
      <field name="n07"/>
      <field name="n08"/>
      <field name="n09"/>
      <field name="n10"/>
      <field name="n11"/>
      <field name="n12"/>
      <field name="n13"/>
      <field name="n14"/>
      <field name="n15"/>
      <field name="n16"/>
      <field name="n17"/>
      <field name="n18"/>
      <field name="n19"/>
      <field name="n20"/>
      <field name="n21"/>
      <field name="n22"/>
      <field name="n23"/>
      <field name="n24"/>
      <field name="n25"/>
      <field name="n26"/>
      <field name="n27"/>
      <field name="n28"/>
      <field name="n29"/>
      <field name="n30"/>
      <field name="n31"/>

      <field name="n32"/>
      <field name="n33"/>
      <field name="n34"/>
      <field name="n35"/>
      <field name="n36"/>
      <field name="n37"/>
      <field name="n38"/>
      <field name="n39"/>
      <field name="n40"/>

      <field name="c01"/>
      <field name="c02"/>
      <field name="c03"/>
      <field name="c04"/>
      <field name="c05"/>
      <field name="c06"/>
      <field name="c07"/>
      <field name="c08"/>
      <field name="c09"/>
      <field name="c10"/>
      <field name="c11"/>
      <field name="c12"/>
      <field name="c13"/>
      <field name="c14"/>
      <field name="c15"/>
      <field name="c16"/>
      <field name="c17"/>
      <field name="c18"/>
      <field name="c19"/>
      <field name="c20"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHls1/nfOq4E/sdEe6I6f6ml5jBLOIKb1Li+0wv6iG8m7K2kca2P5LW7mmj2GPxqwX+Ss+GjXTjLi/eVSEeXC8M=</Encrypted>]]>
      </text>
    </command>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtV+3CO2k9UGA9k03+vmFFFpTqebowhNkU7zbHxV6IaQM9HDz/sV55eKsIcXNLATLtepTYGGsKVEZzw7lN9yfL88sMOlADNy81RhPu0nbseP0WMYr9IUVwMPJNsYwfOqEPHqMdRHCsjXzfdlHzshezQ3aH6lyOGCf42JM1P5bwA5wWRIVWdz8obhBsXMtJt17SGAvk51pGAVk3npZfVbDqUe40/6L5ujDoUfvTosyIBdKFwS8bUWCVHInUwMdO8AJl7WGL5wNTOIkE5fBVXyBRvHZwKIk4llE/Lptika8FIxb6Ro7U6xRRFlaE+3hIR3I500ZYyEcw3RccXFraUHB0nyrNJidrsR+dCLJEyTZyBeREXOEbXpkESuemgnZ3EmTaX7OAI7QrRrQnFmKlbZxjGqSwHCVVHevCMjnMrdpvNyo7gQPCOBYE38ZSOmSDhv2SHQHQwHMtC9i0NG9Yw0+PqbjV+QA9Dft2rD35zaeF+oXB+00OmNJUba78YnNcWhGBiKYAahPk/WoB03ztSO7NwgNUFQCK8V+zup1jq3e2NPsEmD+JZyyVFIuIfyVv2/wFLWl4Iw+xafn/RYPojDp3BUiGhVSrWtpTobITVSIzEupXIP5lQ9pHTxKjBrNtOn0Xxmd2BLRi5kKntGgORNxjZ2GnGsX7XLgmgRfYyXbA9ggQiRRcDSnvA3e+jkxVSCXj4/oYKsmKFVIARCUDwJSguF3WlxQRiAj6IHa7ctFP7zFaNf4Kcyir266nHt6wNV/b+9+sJC+/6doK+mCh99DvijllnYid2DT0beQEs1emkkCeIN8mdEiyu/BRYmTl+HhF6v8TVzLiBhEbW1sq7UJg+np88GocifbX62QyQZAkvEadjRPn+5HsN+fZ+qvppLs7mu6W9eCo/aBW5gHWgHEby8zxQfmA1WhfUzppQMeOFTi+cJNPKoYiOSEDZxh++ZWlr9b0Le/LzRytJ3ejDf4gAO4+BzvVX7VvbTczRWcJa/g5jZlCw9qXpy5MQAo8XXW29KllUgPTtQPZG0uekF9YYOwX4yNUhfkiAsJZ/W4/Df9kp8mXgLYpHEHLVeNhUKQIAsbyxIp/aQAjQtqsFPnRZD3Kco5MOmWDxVrAXu3TIwyGQRN4wroXQ8kmAok1EO4/R65EQiGUFcKCZRvdvaIIaip1v1/JqfZNXdlz9FeRQVy74n+tCwRfrVQpGLsn9Zez+7nBx52RIkHg/lUVS1ow29SqpCZ8qpPt5otFeTYDgQ8JGc59/KgCOKXRx31GFCVirHv60HI+6NY4i9UKCxF+63C5sDyVpx0d/XnMcu984RYuVWpT4k+O2rABturspaO/g/WuBA2X89BPLRdR1eUpUst+TcFEyYAuQvkjZqpjSXKof78nR9V+6YPXE3dXtoLydJ9N7I+ZfqsNDMxzxmlHwqblXRacLvCjI46wFKFYRYmxk4d2sY+Z0BaRC8Dc8/yjemwbq/Zil8nQaCHjvKZlrpbDrzEC7B1sdraXGgNlQARMDmBWnqd8Ex1N89ulZpSVTMBwRhhd9g043j6A/0tHIDwY7NnyIEynLd1qhy4//SfoHBsUAUd6SngsPZXWdJzwy3hjBmtLhuCMYu9qzG9qEc=</Encrypted>]]>
    </text>
  </script>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>