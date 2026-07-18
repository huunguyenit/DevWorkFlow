<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">

  <!ENTITY defaultTable "gltcpt11TH">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="loai_ky" dataFormatString="1, 2, 3, 4" clientDefault="Default" defaultValue="2" align="right">
      <header v="Kiểu báo cáo" e="Report Type"></header>
      <footer v="1 - Tháng, 2 - Quý, 3 - Nửa năm, 4 - Năm" e="1 - Month, 2 - Quarter, 3 - Half a year, 4 - Year"></footer>
      <items style="Mask"></items>
    </field>
    <field name="period" type="Decimal" dataFormatString="#0" clientDefault="2" allowNulls="false">
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
      <item value="11-----: [period].Label, [period]"/>
      <item value="111----: [periodFrom].Description, [periodFrom], [yearFrom]"/>
      <item value="110000-: [form].Label, [form]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsDCzDTbAYjxedDUkYV9a1omgMm+cPs69mQwYzgY3h4nm01Vlkt0i7ZN4aRatfJtsDQn3rKtCc97AlUK5bm5uQIgRsqCwntXP0WJGnqD/KX1yf6jhaytSurzqZp3cYgi1qhMOR+RFr1RxqqMoDaJbXwmtryCQiXj0VNE6R7IHguYtAZj/MMQU6xtNpMs8dPekKp3JMGdTArcunRzLPCSJl6k</Encrypted>]]>&defaultTable;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR77vgMbfRI3e6BDGxfc5Ox9TJa7T4TsH/1P2o9YkLHpmcOiY5iE76Ty6x+rKi28LDzqfAa+89aJO608ZQZIYnZH6JPOLIJr75Ii71z7sZSd27uVwqIfcqTxdkJh5W27c+5VnxWD50aqtVX/Pv6MPJlptVGM6/IgfzAFrAjvmJA20WC6pmDEeh/j0i40IlAoUbCNlIIT72aMgv6Le8ewn+wysVcILc0V2oaIihBo+i+D9e</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAA2yLSlHLMIpNRbXv95PEzLcpXyvZZ1194114mb0OWgf1j/Jyhh9NigoTVZKxMZ+5ncopM7fC4xJFrg0Bsm6bpVUgwJ3m1/0MYWl9CdXYGWn+3+63FQ95Rek5lPdaVLMxasRsoWI0wSJyYbO5j1T7HnBvg/neqFJCwHo4ssZ6bPnrrM1R29Wroa9OtZgAFLVV8Fi59YtuRdZ31pmgxtzudT/m1DYSU+vKrElrHvlYI36ZtTXCR9RfNh24tGH/DcoQZNW7LFOJK1BXoRTcgNb+mfQCY3ox0cHigVYiWnmPRH3MKpOz3doDadBVP9ybMjhpX+EGbvPG9JGvTe61TeOurW1K2zqtJO/CFfQ7gEX+37</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdM3UOpvSWZBBdKWouRu5rKyrIQTMT7Slu0ZC6B9TlF6yqMpJXaDvgMrIYdpITtoD555EYuzLZrQfj/N+SX3D5bLrzBnBmf98JtiHIidl/XKOr46CVEJLi6emH2ifc54j0O4m6Eu7Au/esDROOrJJeIl/iBzxJib9Pfqgb6n9UOxke/P/7kXsZYHRJ4UQSKhkh77Ier9z0uonj+e2Q7ekO0RADlN9P0rhP2puvtk4RGrfDQNRBRimSsXsLP5UAYWnKR69IeqLtwXDIXgKTLxa7VR22CN626j8r9lvYRQxQ3oNiMUio3jGa/z0gxSjiZG7p6WhD4XYKfK9J6T/3ayrFNC3Nx0/SPU+4B4Uuu0T/XvOBtTwqB71JlfOwzBNhl1iKHAwT97MkU1Tp5Ie0m+q/c+dV3uOsLvs91LP0Q1qonTuE6GHVVmMLHsj2Z43odqohETmHij1wTjxuusp+7l6LHs4LIt33CfzIsI5sHRRa8j3QCgo8+hdZAPkWRV9REFuWys0cwaDPELkfE2Qr6UCkTFHxzTyCcgsWknHVA6urNK8n/KRnis4Bc7RR0MdROhyI9QG2hVCJ+k0RlL1VKvFL6V7vKj03kRSJ/lcV6VN6/4HlRc1nXlxJUK/N4SQNI4+xaC69Ma4nvpEWNaj/g2QtcXDioBN3I7/pvrheUdAY2zPOs2Y/AGcu3TqrVrR57pkSfcUhlnq+t/1Jk2Qa2ecaisT75iJMCe1QZ7NQk3djpl6XJ55r9ckD+q0HPllR9Z1lRMCeeSYdJFl75FmZqYFnYPa1U61ltTMU6fSO38qhDV8d19NUNrL8RSMVPD0DYOZ5SoVpmmTRDK3+hFUSvDp+TpgVRK3QU297MQo1hFBkRuIPFAbOBlujj0UtCqxTjBfzw==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>