<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\ReportCircularTypeField.xml">

  <!ENTITY defaultTable "GLTHUEPL01_28">
  <!ENTITY defaultForm "GLTHUEPL01_28">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Ngày từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>

    &ReportCircularTypeField;

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
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="11001--: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000-: [chon_tt].Label, [chon_tt]"/>
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
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Uc8g5OfgexqopbGEL+wHq5C9h6UniSZLo1KHgewzu9nWCB0mlXOGxZnXVHLsmjC30Xns7FgvSKD4PhsdryZKaVPyqBWxRzWGyUzT7AaszgmeR3VuV3tMLiRhzWShnpTfkJsFguIjLJ1WZZHwe0cldE=</Encrypted>]]>&defaultTable;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ4mLNZehf14I2kiFHW9yD9Ac8SRJstwx0Ii2s9UtFY3S5Txzc/nVZ3g+AjmZHgL2LmhP7h8EwgYTuSOxTLvS7qobHJ0Xfc+I0Gm0BauOFKvnCTHU1/QbToFLXgp42fwSvsEe9gyVQO0YHZHvzlWLnyk=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUpTGGv1w+iiyPFOfxifCL8hdA7B08xnvwG/eJYId7vX5k4fakxp2403YCYiA0/kShAEyYcHRUiiY2nBeW2Tubk7HzjRD/EAlVJgWIqAAwtB6LxdaT5xCd67uTWlNLD+g/0MOho7NDxgcmNFkMH2c1D1AN7PMOrPzMz9nMxIsGrrXesQgTIEIrt0s/khQjaGXnN1b6lC4hk8khAIhTIzg6QOQBpyeLSFweEL4j3f6bADm+tmdw3km/ltvEJ49c6begEpBt1r9N6UOigPPVIrD0bgArqt483gdMp+OtnMMMFXST2hAYixAKWIiXeIq1UdYt5cat1p7ecq28XTblGeHhiwnmCVVm5cepP/MiUZJ8lvLGhHEl1Lnywn+7ui71l3Hvaav1s+6H0N+dcKJai6XxIHXmzcNEgA9rJXvV9ZksRDCOkKL0v7BUl9mW+aL0PEnPdgTnrxv066HKEY26yp2PEBrsaEwK3wKM9chN62psdHY0Wr6Pluns/J+NI+AanZgMwt0Mr6Qm0CnNmTQD6QtAmd0cjOn4ZoLxToAxw2C+CyhzmMyFtbAzI0qXJUlX7kJSTnScBETlCANLcSEjQOIBZDqJEVi+Y64Mo2NDc4H5YmPf94SjV9SkKpGWc33w3tvwNASh3uoSVyn7PGJ1/BHLvI/ROlYqQyHenqMH4ITxJCaQxc+XMHNSCuEHCMIu5bI/KjaTCgeQtdEf/XEBrXqqNw==</Encrypted>]]>
    </text>
  </script>
  &OutlineCss;

</dir>