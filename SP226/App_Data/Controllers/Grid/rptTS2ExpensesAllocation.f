<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardReportToolbar SYSTEM "..\Include\XML\StandardReportToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\SessionInit.txt">

  <!ENTITY k1 "tk_pb">
  <!ENTITY k2 "tk_cp">
  <!ENTITY v "">
  <!ENTITY e "">
  <!ENTITY Url "~/Main/rpt_btpbcpccdcd.aspx Script: \'passQueryParameters(this);\'">

  <!ENTITY Memvar "">
  <!ENTITY Fields "">
  <!ENTITY Seprate "">

  <!ENTITY Parameter "">
  <!ENTITY Session "">
]>

<grid type="Report" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bảng phân bổ chi phí CCDC" e="Tool &amp; Supply Expenses Allocation Report"></title>
  <subTitle v="Từ kỳ %p1 năm %y1 đến kỳ %p2 năm %y2..." e="From Period %p1 Year %y2 to Period %p2 to Year %y2..."></subTitle>
  <fields>
    <field name="stt" width="30" type="Int16" dataFormatString="# ###" allowSorting="true" allowFilter="true">
      <header v="Stt" e="No."></header>
    </field>

    <field name="tk_pb" width="100" allowSorting="true" allowFilter="true" hyperlinkFormatString="Script:">
      <header v="Tk phân bổ" e="Alloc. Acct."></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJe9/yg7GiBHLAPDwcX7hGN7PibRCJLp8wsaL6qJZ0Mkml96iSM4hhVrVkpSC43Rgrw==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_tk_pb%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tk phân bổ" e="Allocation Account Name"></header>
    </field>
    <field name="tk_cp" width="100" allowSorting="true" allowFilter="true">
      <header v="Tk chi phí" e="Expense Acct."></header>
    </field>
    <field name="ten_tk_cp%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tk chi phí" e="Expense Account Name"></header>
    </field>

    <field name="gt_pb_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Gt phân bổ nt" e="FC Allocated Value"></header>
    </field>
    <field name="gt_pb_ky" type="Decimal" dataFormatString="@baseCurrencyAmountViewFormat" width="120" allowSorting="true" aggregate="Sum">
      <header v="Gt phân bổ" e="Allocated Value"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt"/>

      <field name="tk_pb"/>
      <field name="ten_tk_pb%l"/>
      <field name="tk_cp"/>
      <field name="ten_tk_cp%l"/>

      <field name="gt_pb_ky_nt"/>
      <field name="gt_pb_ky"/>
    </view>
  </views>

  <commands>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtV+3CO2k9UGA9k03+vmFFFpTqebowhNkU7zbHxV6IaQM9HDz/sV55eKsIcXNLATLtepTYGGsKVEZzw7lN9yfL88sMOlADNy81RhPu0nbseP03PMdXgyuJwwTPia4zeDtbQiI8C3Op3LSVs8rghzXrnekTiDo+aBQ0NUFLrqPEuuL939akeK41i/jKSaDz5tBD8o6UOepwgy3JiPrHz3dSehKq8iWO/pRt20ZROOmHeaOoppGb7omq00GkfiZHfJrdjzz34ybWhi7MMYfEml+/uolzK99o1aF3PfTdUMbzztyfk/BNSd6ODzL5rSXMZKKA08yehCA/aeP92J4JDuf+Rar7mZa4C4UNPnYM53BIuqZgY5eJCMw9+kW7imhnqM3ISgFecZ0yfh/xRBot6qPs3v+t4gvOKm07X/fSMvwgNess8unai+JOLe1zB5vGTJSdiTnA3eniqJ4ZjJFdA2mRAOEG/8TCTxdH7GtdqMMi9YHRnwbPqEVApmasCrxwcsJ4MD8d6EzRGGRnFnuIZ4ridChENyX9u2FV8Msdd9jai7yCaWEw/5blkdtgsKc3FfaQzSUmgD2pUvasD/ONK3wg1Tx+/q3MK9lBAO5PdpTXfgmPewHX6BWFoXHQsNIoTCmy6+D6qvAOCcjVggtxeoltAw=</Encrypted>]]>&Url;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egaQzYk2vWXO4naHa5bRC162yaV0ymCL5CFU7BHL5d7lrHR96mWBLKwPHWV3dd+w5bvJtSyMD+AxFzgE+b+esZUc=</Encrypted>]]>&Parameter;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f5cv01dnfQ7A7D17EAqD8DRR6xdEWAvSl+ShUAWXm3Mfk+kuUYzjUg6BzYCaseU30QvmLDNV51gaLQ/isXh5W1WObzgXiZx1aRBW6MWMO46B7GcVvEpeQFptA1B/8NHMr8O9NIur5xfKbLATdg0KgbGKkuegi7wAa9CnO/oD08V</Encrypted>]]>&k1;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egV3ihrvD8mLivDQbNDohZXdUDU3d467oSoija2KhF3oO+DmSOF1QVcqAgRZDjm/OPimVqLF4xG+VGMAHM1BMspbZ+9Be91GzbWNWu9sze6VARBpSgyuVPkrTwFkPFAaMdg==</Encrypted>]]>&k2;<![CDATA[<Encrypted>&LSWvf7rDTAb/Sg/3CW6egWSNpkAR+ayQE+MG5S7pKHyeNXWI3loCaBfwbII5JqahjulTv7Qh9DgD3I8X2R2r0i7TyxVqQYG1geut+n24UOakP3zLKG6Ajrk8/TvBIjsR1/5vsndG3eHSjxPcNfF7vbTwU/yPCd+lDg0vi8sBEIliM2b78CXqA8W4ANs1afmTr4qGEZusu1tIBeYagGnN2RYAIYtfRWrwNC0rr/jFqeY=</Encrypted>]]>&k1;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFL2ZdG4+a4RqXDyr0/1uix/cO+dh7BwlRti4m2zZfa3+a/ycU3kDDfnb/PqYqXdz3KCDYghgnwjr30axV3mg/JFvMi06k1ied4KK/cVpEtMm</Encrypted>]]>&k2;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFHYOEG44EtL0DmRY7NEHMIH1GeaWmZLjmPIfReloCeA3rGHPmitjNFg7R92DnEfJ9gBhzyhSZ7kda2YayPZ8Lbgp93FCz96n9hq/eelhTr6y33bXz23NA1S84LkMI/0PJw8InwShBIXHmxssLlfQ2+1hf3h3VW1kj27IPEmUxYCJH0wXpWMw5fY39V4XV/h0WjgLeLLy9ua6/DV1UwsjoJ8Q6bIrSh8dyckFDjNYITUq</Encrypted>]]>&Session;<![CDATA[<Encrypted>&3/ynUYepZpRiAlwlRh2K/dSJ5TpH8AOfzvCryi/SnOhBs6xNe4U3qnRfc7twg5Qj7q0YLb6XgMFd+t0NyYbjNg==</Encrypted>]]>
    </text>
  </script>

  &XMLStandardReportToolbar;
</grid>