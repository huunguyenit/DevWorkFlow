<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY XMLStandardQueryToolbar SYSTEM "..\Include\XML\StandardQueryToolbar.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY DynamicFieldGridQueryString SYSTEM "..\Include\Command\DynamicFieldGridQueryString.txt">
  <!ENTITY DynamicFieldGridQueryWhereClause SYSTEM "..\Include\Command\DynamicFieldGridQueryWhereClause.txt">

  <!ENTITY FilterInitialize SYSTEM "..\Include\FilterInitialize.xml">
  <!ENTITY FilterQuery SYSTEM "..\Include\FilterQuery.xml">
  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY Controller "'StockDetail'">

  
  <!ENTITY QueryString "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4cpnAGGfU/p30uq8IzNmeEc=FastBusiness.Encryption.End&DynamicFieldGridQueryString;FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu/Od/goVuhLMrED22GbgbTBTa+jsBgY3x51H38How9l9KDr/oT21o/8RVySwTE422RA0ILUt236EdpMw3ZXvIe57c/206gvVdL7rlnMPPiTUg0H3Cr87JYfclGWTbzUR0TXXnJ7RD/OUC+JC/HY1FsASDvme8ciNwXz8iv/0dBc04WuYTD30yvUZ24IyQr3Kb/g0L6enplTACv7/wQd1YSHhvVXHvVXphH/Um9wvXiPyxO/f8obHJ6XoY+BvLds0GznTMCMsdaQwb1Qi52U0lAykn8trPzuupc9XGx/wcjjwZy5txP20dFjYnvGyUCYDpDZvzwX0JjUV9Vu60bCzokkaXTD/KY/zK6aAC5yn9q3qHAdDdgpFGq0wqnMtGfDnYt/Cfs+g5SItj8SXNHgy+vYrhuzgqimhAEGnWAfTpj/iQCHilfEON0+ZPZ6LMTIWe4gEKk5DumpzRLOwtdO+jIziocIu+wc40aXCr/W1gt2ZXSQb0E7f9zNjA1ZxPOvkXwLOHkbQD68UYcM9v2PodVRu5F35NeLZMLc1psJ7INK71jDi2VkVMx+vcFAJnm06eNBKkDf0pNSCITRCUPu1NJQ2XrLwbTP8WL2C0trasSBp3zg/CECBJb6Nv9DC3d9APm9zI173yZjLwCkkA9MNGDzNIFAX5zFGW2VYB5jwIZBmCsTo6Ixwb2GNdf+N2lbiar5zgbEOPZddXqjy+1Pq+kPCq1v/9eiXSfbO7QIM+vtMr0RWWZM7I1DU8u/xjl2MhpdIGEa2sZFrnyYYRqlBMAyrDYTHcIrHFr/Ckcphc/LGfXH7QTL8uKMiomKfDrNM1wLxosfzFVVynxEunjkmcEqwl67w4+4gsD6g76uWF83vFastBusiness.Encryption.End">
  
]>

<grid order="ngay_ct, so_ct, stt_rec, stt_rec0" type="Inquiry" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Chi tiết theo đối tượng" e="Detail by Object"></title>
  <subTitle v="Đối tượng: %c - %s, từ ngày %d1 đến ngày %d2..." e="Object: %c - %s, Date from %d1 to %d2..."></subTitle>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" width="80" allowFilter="&GridQueryAllowFilter;">
      <header v="Ngày ct" e="VC. Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_ct" width="60" hyperlinkFormatString="~/AppHandler/Voucher.ashx Query: {Name: '[ma_ct]', Value: '[stt_rec]'}, Script: 'beforeDrillDown(this);'" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã ct" e="VC. Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="so_ct" width="80" align="right" allowFilter="&GridQueryAllowFilter;">
      <header v="Số ct" e="Voucher No."></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_kh" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã ncc" e="Supplier ID"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_vt" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã hàng" e="Item Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="sl_nhap" type="Decimal" width="100" dataFormatString="@quantityViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Số lượng" e="Quantity"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="gia_nt0" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá mua nt" e="FC Purchase Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nt0" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền hàng nt" e="FC Purchase Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="cp_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Chi phí nt" e="FC Charge"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nk_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Nhập khẩu nt" e="FC Import Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="gia_nt" type="Decimal" width="100" dataFormatString="@foreignCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá nt" e="FC Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nt_n" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền nt" e="FC Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="thue_nt" type="Decimal" width="120" dataFormatString="@foreignCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Thuế nt" e="FC Tax Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nt" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Mã nt" e="FC Code"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ty_gia" type="Decimal" width="100" dataFormatString="@exchangeRateViewFormat" allowSorting="true" allowFilter="&GridQueryAllowFilter;">
      <header v="Tỷ giá" e="Exchange Rate"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="gia0" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá mua" e="Purchase Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien0" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền hàng" e="Purchase Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="cp" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Chi phí" e="Charge"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="nk" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Nhập khẩu" e="Import Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="gia" type="Decimal" width="100" dataFormatString="@baseCurrencyPriceViewFormat" allowFilter="&GridQueryAllowFilter;">
      <header v="Giá" e="Price"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="tien_nhap" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Tiền" e="Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="thue" type="Decimal" width="120" dataFormatString="@baseCurrencyAmountViewFormat" aggregate="Sum" allowFilter="&GridQueryAllowFilter;">
      <header v="Thuế" e="Tax Amount"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ten_kh%l" width="300" external="true" aliasName="c" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên ncc" e="Supplier Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_vt%l" width="300" external="true" aliasName="b" allowFilter="&GridQueryAllowFilter;">
      <header v="Tên mặt hàng" e="Item Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="ma_kho" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Kho" e="Site"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nx" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Nhập xuất" e="Reason"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_vv" width="100" aliasName="a" allowFilter="&GridQueryAllowFilter;">
      <header v="Vụ việc" e="Job"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="dien_giai" width="300" allowFilter="&GridQueryAllowFilter;">
      <header v="Diễn giải" e="Description"></header>
      <query>&InsertCommandFilter;</query>
    </field>

    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ngay_ct"/>
      <field name="ma_ct"/>
      <field name="so_ct"/>

      <field name="ma_kh"/>
      <field name="ma_vt"/>

      <field name="sl_nhap"/>
      <field name="gia_nt0"/>
      <field name="tien_nt0"/>
      <field name="cp_nt"/>
      <field name="nk_nt"/>
      <field name="gia_nt"/>
      <field name="tien_nt_n"/>
      <field name="thue_nt"/>

      <field name="ma_nt"/>
      <field name="ty_gia"/>

      <field name="gia0"/>
      <field name="tien0"/>
      <field name="cp"/>
      <field name="nk"/>
      <field name="gia"/>
      <field name="tien_nhap"/>
      <field name="thue"/>

      <field name="ten_kh%l"/>
      <field name="ten_vt%l"/>

      <field name="ma_kho"/>
      <field name="ma_nx"/>
      <field name="ma_vv"/>
      <field name="dien_giai"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/4os176twMEBdY0xyo0KN2YdPUfiUkjbqIrM2UL0eZ3KpW8cVAewimHJ31rFymKydf3HMEvI36G5HULf++GNBhV5+G8MV/d2k9glrcOBUYdaBVURMMBdjHLY2/W0yHDs+ECbKIeVsmMp+576uOMjnxcBZ0RIPqfrbF+9ATK9czTZV5P9gxvP9hOJLBhFIY3J3uTbm6vqd0pp5jT4CmKHudW36n/CpNY4F9RLEtN35AoZsGiTCkiEwe7L0FnW23s9W8gStlENa/ItW2/W2Wh6AKcL01y3gG3NCH2lWmXcKTs5UUD08kcSGOnTGZHUF/RXQscgOV1T9UKUs77lx4qeoZTQUyQNibg3uyAAVQwtFT9bf2FDKXUeOhTfKpBCruz7fY4w4GUyY4vOFex3YdOrNGdDbssUQlZhDHEnL4vq9qKNh751lFGSiBFIzru8ItJ5s42ZMc0vrJIEDNjK1WQdRiw1pPpfufa8khEwZoaJqRAKDOVXcupCWonyDKvp4Ylo1pSfx7ngSwq1SMC83EmSjk=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>


  <queries>
    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>
    <query event="Finding">
      <text>
        &QueryString;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu861sxVDoEfn2H3/Ya0utpxRBveiguOiJMcW6qm+38bAjsPZ4t4yoimT7qqd9OpSU+tpO+vCuNAMjWLY4XvWYCN4ugGCV6OR+OHCPhx24IUwWR6sQeoLN9SpDacodzxcBaBqL1IMmBYYm0XNWQXkZlTx0vubuIP0qTKy5dToy6nYvkzey86w7WEVGZZOH/VCXorVMjfGRjVlokwpwj10yQv30qQG51tvmVdIC7twBYZcgC4kxzpAdAiqeY5inBl3GpC4PvK6SQM4SRm8KWgQEnB01x9QtBH9pk7DRNuAIo/swhiZ9RSnUA0Z2n1BYEHzqFVcoSVaiogYE09dwper0q5Z/s4zBWOnBwWyT83xq8TaVjpD0FIOlLsfQC4uudkZsby703aF4q0K7rySbSFrPjgBgl3wggPLs3s5IL/fSVzaQHq91LqftWlJ38jLCnKkMp5DobA0TS8XIuon7Tfkis04sJFl1flUqkczEhawgi/FlCpBrB7kjybIEkYkJUH3D/AnLtHugBG//+b0ZI/A50MUsEA/Z0nuXKL2n9xPZBV9/IZtcPjrA0xH0hkrbFBMf0VVIAJNyRArJgbMmd0K42fGMt8NDsmF9s6osrOt2epj/33HIbiNVvKlBlG329APDKdWxawezl8kFYW1fB4jHhQ2reAuhc/wnAW8UJci7Ju1HD/yPtC2AWb1w2PHkdVqyr4TI88hcaUVTofV42NiO2zHaWCs9aH0Iz9UsBGz11v/sa78GqwjJspUZ7YYaYL03CFS/EyHcNnSmDae4MlYVayBQw9Ia+ZTbhNh5TkI9rVzeUqcQX/Csl5YNfVodqCo0xmUtUXEZNsMnr1/2CH9GqESGbOJm8FTfA3907TdcioZ7GhwmhyEn9/+O5jPwnuN5PYo7BPQ2CqDboZUQeS63iBQ5rwLVi5ArItmG8TlCwlwy++YZF3RFDzvUjF6XP0TfVWkLnx2z7cQmppa+QA/POY=</Encrypted>]]>&DynamicFieldGridQueryWhereClause;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&FilterInitialize;&FilterQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssR3uArX5Wit5uDARIan/HHIwJQhpK7bVqLwsDXmwTbP9ppoBlysAmNMO61qr8hdl4wlSOB84ODGYWck6JRBS9gm/USrQmVHMV6GrVC1U1QZvJLM2MNBxkM7GBNND5LsjWbjRwvuFqUL1IMnSvlmnq6MzR1mDzXxZbNNvY04zM4FqR8Zx9aVnfbgNcSLkZWbMSCZSFtMHR3OLFcf9PCviypQvRGVsdw0a0d5jItDTtLGW4RGMw86uOI32DNeGmHTN2hLmiTXEhUNIjip/1dOwOVYQyfPeCZhi14/5TpOMiY3Ajj41B3iCV1td/cmMf6IExY=</Encrypted>]]>
      </text>
    </query>
  </queries>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtUI6ULI7062UMByJPaISuCtvnBus/kg8ewstuZRlJDog2gXfzSddFb5luD6xQw+WpbAA0kBpcvrwxeMayHJFbO3bwih//UecxD+OlvGRm5nr8NLECsWxOkeVyIbPEn4H2JGi6wtTi/RlgxRzh4nxPIXzoa+i5P9wDU8Jux3CPfgEloeLTukWGszBkyVa1AaEwv0LAHPcF1mVqAMLM+1XLnuWwn1kJSOWWO9THqAiyznOvL5hNmxMCBS89/ryc2z0K31eVdRuRfLAdNAYspFeySfUade6GdYd1Y1/7thzYKxd66a2RtGFpDXg1LFSLyYAnc9DyN9OeFnm8Uyg908FgZfJmanyQqwSOHXTtKldny8bfCWFkE8mzWbvEqk5Yjuap7SKH2RQ/ex0NKByyNJfk6dbqlw/bkX23UbvOKyneSQG</Encrypted>]]>
    </text>
  </script>

  &XMLStandardQueryToolbar;

</grid>