<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptStockCard">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A08200\ReportCircularTypeField.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
  <!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY Controller "rptStockCard">
  <!ENTITY DynamicReportFields ", '#$query'">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
  <!ENTITY % ReportMargin SYSTEM "..\Include\ReportMargin.ent">
  %ReportMargin;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ma_kho" allowNulls="false" aliasName="defaultSite">
      <header v="Mã kho" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1" />
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" allowNulls="false" aliasName="defaultItem">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99LWeKcpDV7GFdDyVy3RoD0J3pIqv3Y62T10G5/gN/6Ql</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>

    <field name="ngay3" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>

    &ReportCircularTypeField;

    <field name="mau_bc" clientDefault="20">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Thẻ kho" e="Stock Card"/>
        </item>
        <item value="20">
          <text v="Sổ chi tiết vật tư" e="Inventory Item Ledger"/>
        </item>
        <item value="30">
          <text v="Sổ chi tiết vật tư tiền ngoại tệ" e="Inventory Item Ledger in Foreign Currency"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    &ReportDataTypeField;
    &ReportMarginField;

    <field name="ten_dvt%l" external="true" hidden="true" filterSource="Cache">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110---: [ngay3].Label, [ngay3]"/>
      <item value="11000-: [chon_tt].Label, [chon_tt]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <item value="11000-1: [loai_du_lieu].Label, [loai_du_lieu], [ten_dvt%l]"/>
      &ReportMarginView;
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZPRiKEfPKjxHBmJnvU1lVtlo+1Oh7odASSFZnsPBg9Zo+rjYXqzXYFeMYQpMONV0=</Encrypted>]]>&GetReportFormLimitRight;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcM0GUti1kCp50u/Joaj4mLrRFBFrkg61EVyh0XGpA19zx05m0tH1OgdPSKya+jhQB92mZjn9Ot4aMXMuRM9wUx/xclTHT0ytQP5YzsDNDeJ2</Encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
    &XMLWhenFilterQuerying;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7S1FN4LnI67UEpN9mQn9PORZYKb+4U76L4D6lGpMDLVXDIqD/wBTDZ1DlxsaLIuyjrNaWWicvLyEUbR5fnwa17B6ABMf7/qVYkLobwySbqflPxRJ7lP3kQjpEAkIxGCBGsPZtgne5uLp2oEhs5gcRWVB4z6M0cdaiRBaYkp5E8Gf+O6uGnjC1gGlEvNwBns/racvnV8lxVWh2OM14AlKGYp61Kp3QAfN8czpEnyxiR+vb9bErj/s9jmGfimEzfO22lejZz5/R7oJq1qn50VGURgaaLPfvdApYwtmB3H8Me+c7gNFPN7h6wO2ySEGMJx1EIGXrGLhq7XUWEcDY+RWt63J+gia60qi8BIgpIblAsJv4lk3Bxj6SguG8ZKxJT649X807SRTobf6FC74vO3S8s98xysHoIn6lK164eAcPbdoX81vxpy7rj2fmASHJJo+OlcECrHC5TM9LgSR/yMjmx3gkhY1aznqR3ksf9flvu0cD9fEyAHW5Euf+QhKOIUWcBT4Y5uo+bB7Kkq73FPceir52PU/c6VaxlBtfMkQoTi2gXIVj7oYSQAKdNePq9FvfNKyfwLWmKP1O6FDy7q3VdhnJa9eXmYCJerdM8uoXPY0/jJj5ijvpZBwnS1aSp7d65oWQ08M4EsZyzyBEgHlmZD5LBqCKXJufwrss/lf/4WFIGYIo/O87Gf8PBWFaNQ/A==</Encrypted>]]>&Controller;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKFyn5nqtVBL8WX4eo6H2kabgBcKsgcm4iH2SLI2Ez1+</Encrypted>]]>&DynamicReportFields;&ReferenceParameters;
        &ReportMarginProcessing;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdDqS2nZpjMFZD+ajcJqY6S0MraksmenqXt2vjKyhYADT9dThGpA3OgxWuGsBSoFJP88Eqh9wzKYzYj38P04T8WoZRhoAVShYjmkaE4X+CfmTUlivwoiTfld7wHbKagRz3ncmEb8siasR2DaLdbKtKeVWJt0sLOa5/qhFjxuo3sIgLU8cTnUmpn7HYHra3//FJ5KR90qT75ITiWmUD7Qb6EDU+2ctCt+cNcVNhVrLErtfbknjBC57Ecbc88VbQK5K0hwWoE7WyZacwjMpJeICfeLG0GuYK4TLmysnJqijN3HIyNRD3L5L1T68mvcq/Ap8NuLzlVol09bxaXpR69kyUqmQq2/kaO9J/88XzzBz+pEUZTgOY6guscDj6tD9r0NorU1qB/FXe0VGOMzSjYuN04ijitjNfOMPaFteC/upICxc0DEFJ33naypmOeYIeWbsNCqJWXk6zKSv0NrXG/SRVTpBkmBXd6LoMBgHo1+TH+IVxiKS78vbgFsnrEmcDr1gHQvzLROOKDHvMdOeVAVqc23TE7kU5eJvLfeI0i1REf5ttBvKbIkvRcvv3HKEIjYivxX5l9zQen454rSCFXzRxDR1wELMRz/gwPQRJvxTyxVhoZoslKFSuTQHajhOYDUPXcJmMeghgrGkGsW+M1LFXASRbiicebo2DTqTbZ0VySZCo1++g6AC9e28hPgmpqFQ04Ngbiq2F3p18zvsxdplzdtwxEP5hj0q91ld+KWGXp182ZBJfK4qWt0xYxZKWPm0n/BeVcuYiVxWCZP9s5YP04l+BVUmWNtEwr6EXePZZ7hEjoGvDS98TxjweMY8JA3P8vSBXJhuJQABL4DPUQayzbBYEsMC0/ZRKXoSrQmgbLj0a85+u87MkMZFIkt7z912mj351NVRvxm0CCY84RCT1Iwod7aXpIuz7Z98QEerprQnq5Gx93Mum1SXt/r0dYx06mLDAoan3nqfN0wbUKNNTjar5WlKKsEeGBV6Mv9wgGuCJwd0WkljB4n5mLV9Gbu8hN6wLnLUsd9VEY0MF14jGiFp5JmZbPOD8Z2zJuB5y8VJ4/zsKJgkq3b/FpyUGJyWtLBOWmz8niYNAYyqmwV/NX+2+ykLLCBbhC+vTvxmpuf3eeJAXzSVjE07rC+ZriVXpw==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouidlyp7ijsmO8kEccJNssgLwL7nYJ8/cWqmJdqZ49hQ2aTQgMuKLvDJwtoU9wnFhtIpQBwFzXAsSRfkzEaq3U07/j3lbl8g1ZvytlK2X91NNVxlzRw3v5+QSO/CCr+yibP2i6zfgWwgKFTZz+iIlt/WoOcQ0m0KCsprPAHdxtrNvqvES5orAidgqyz4NmJ1lb1OasxXe8kIxK4UP0dDR69cDWhOXhP+hP7DwFuZRVf2n2Q==</Encrypted>]]>
      </text>
    </action>

    <action id="GetUOMName">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4kmU+acnSxSEMF73bFCyVi/+NGqYY+Uk7bssbpWiORF8x48Ch+XeOCsa0S+Pnq6W3fDQic0Z3KPGy6qzOfJMNlj5goJrkLtj7cwZJTHK7tTYK4DoUnM9C826L3pzGnuk7xqPKi0d4pnO/cKUSSofsEzU7lJSGcZUbjmq9AFf84PgLwAfldV1zJ40G+TeQNwRg==</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>