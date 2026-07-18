<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY FilterCheckAccessUnit "(@@admin = 1 or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1)))">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\ProcessLockedDate4Unit.txt">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
]>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth()+1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99NaTa+sGe9iXhqI4AF4hyy25e8RquC46emEvH2TbGcNpvb6QYyAdZSdMvWFlpKWfhQ==</Encrypted>]]></clientScript>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99NaTa+sGe9iXhqI4AF4hyy25e8RquC46emEvH2TbGcNpvb6QYyAdZSdMvWFlpKWfhQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ma_nt">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="ma_nt not in (select val from options where name = 'm_ma_nt0') and status = '1'" check="ma_nt not in (select val from options where name = 'm_ma_nt0')"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99NaTa+sGe9iXhqI4AF4hyy25e8RquC46emEvH2TbGcNpvb6QYyAdZSdMvWFlpKWfhQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1" inactivate="true">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="&FilterCheckAccessUnit; and status = '1'" check="&FilterCheckAccessUnit;"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 100, 130, 0"/>
      <item value="11: [ky].Label, [ky]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="1101001: [ma_nt].Label, [ma_nt], [ten_nt%l], [ty_gia]"/>
      <item value="110100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUHcYuCXWa0Jl5CPXLywaJvE0AF+AONtZ4w0vC5IiQozr4UqBNdQFwoZ8bDr0A/AX2bAXWenuv2gq7y6LjuSgIVv9nsMo7GztmF7WYjb+XmrS9UC888wGQsGEqU2zLxHznY7syTNmNjtpdQ1tNTS31lOMD2pVcRyT3rrdqbtABHG/vkVJoUwJz3A6C0sbut4/q4XKf/8JoyhhyAqlPWCLiD4cQgVueqhxnmkffP6P63lKJ1iIjwTZlEMWf/ZmTDoN/v8Y2sJJ160nIZE/BkavvBcz8Js3G9Icuy43w/t8rnDR42HOMElLFI3qqG99NoWolM6WVsJAnYXTiy7Io/b93/15gxAsnf6AcFTXDjeEt75BPD3pqkZl49Y2ldA/nKdkOnKUS+IUeRnmSM02o5cdXsfnNNcSrvJYtWUKal1A3vjD4WntU28M+j4VCggsJN/xhC91bf4tLdmh+/fnwx7HU05Qh3OD9chUE7PokICYjeaRie1iTAzjIDTF4CLPR6/ruDBEJBqIPtvk1GplAKExk+SA74djHmBsF3cFGf/IA4avB+Nb949vIvG2Gj/rI7SaiNkc/FzU+z/3SEtVsRhRNiWfzQIXsqNX7uOODFwtoEuK/hZmz9RfpoC7xJYWkN1YwHxhzuPrbrLt/1Y4UTYH9N1pk/EBHSiWykcbLmIbB8Ow=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetExchangeRate">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9Ge+QSms2Uij978RkGV9Tlp8CnuqRQn1xMobDogEo7DkgYxScAEUVhmm/ixIQyZLlUjQu2qlVIk7fLhljtoDYD8AQGfiQaDmRftY5WVbwK8mR7p+/qg3nig7QeQB7u51Tg7CMbPj4rBf51gQ9twdiKpRSCnfrwtp0bqD7HSHqGFm7YNYIkWXsrgDYGAcmx1yL4hei+6i/zNIuCrT+LZc/e5d6076RbLlgH52UQ2PofaUIIs1nMT2ZxmZLdxsZxsEOK5hsFLmNjgkebB/jyMp1lbTVfhdCii0d9sZZk0yNNfLfhTz9LEo3rjZna4t/YXvCbGGbbg1cE4cN5yL0MW0MIJvMZBD6Oq0bKih12Nk0DTGPzm2PQEPFisJuzfNz5qi6Q3JubdWq3/F3WjUuznYUI=</Encrypted>]]>
      </text>
    </action>

  </response>
</dir>