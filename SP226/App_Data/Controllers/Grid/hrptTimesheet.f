<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid type="Report" valid="stt_rec &lt;&gt; ''" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng chấm công" e="Timesheet"></title>
  <subTitle v="Tháng %d1, năm %d2. %s..." e="Month %d1, Year %d2. %s..."></subTitle>

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
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtV+3CO2k9UGA9k03+vmFFFpTqebowhNkU7zbHxV6IaQM9HDz/sV55eKsIcXNLATLtepTYGGsKVEZzw7lN9yfL88sMOlADNy81RhPu0nbseP0u7IYFVpbgTlkkdsnFIGJNJ1rM9bbCXkkfQVJ4jM1uFlH7CKyCMVDfrzc7+E7WcWgpcbQ55FJejQ1akYGW7mcQDF+Xm46WZx2jXw491yWzCnc8D6JIRClchcDkyXHrwgQAPNs+XKx+KNnyxsw0s+Bhqa0jkFX/98gcW1v6Et800429t2R5dhtoNFKQxLjCPlNvB4lU+Zy5/ac51rcLrKwvbspScq4aLiJxdEuCYFQxiufoE4K+Fgtl4uctujAWp2ileK5JsJTXGuD+L8/X1r7sQ07FUhQr8xSnnfi7IKg4m3UQ/PS//Wr+6baWTGpYJGO09E5BJ4mFtgopXrwqA4T+EnIjvCuhk+XxeVmQp3DtLhW+IkY6FaEZ6MeMqInHfiNYR3UZXUYg7P8WMTZvXez6C3W5a8hjykoJEcdKw47lNeZUILdc4YHFsVPFs+AzUqBOnCfhDBo0zLptM9NrYwtfUC4F2THspWzQsemZTCfpnampMSdslhMSU2HM6t3DMz9nHK7OunaZWSA7DtDHWKL04wd62XfoYL+h4k19wrSF1Wbrq0yd+S/FFxUP/GRIr+IIj+PMZuGsmLLhbOb+fBjRpVcw4BBeiJA1DnGjFJK+1MIDIGu0x3ajFl4uMo8C2hGpiGyNIwWNGI/q8+kCn9oxVDdMI5s/o0QO0QQjNjrN4n3Yx4kNy2GZdldHt3rFbOGeFh/40Y68LNc3BKOuu7hH53QdRGrApe6BUCfd+XhBhKTB75o7MVtV58m62yACwjn9wyh7ZDP2iTiC69I5Xa6hLZPI4C6f1QFCyg/xMWY9XjQgF7j9EbT2w459iExD4Xt</Encrypted>]]>
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