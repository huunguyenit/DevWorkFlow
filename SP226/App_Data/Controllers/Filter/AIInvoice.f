<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY f "ma_ct in ('HDA', 'HD1', 'HD2', 'HD4', 'HD5', 'HD6', 'PXC', 'PXD')">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;

  <!ENTITY % CheckRelative SYSTEM "..\Include\CheckRelative.ent">
  %CheckRelative;
  <!ENTITY CheckRelativeParameter "'AIInvoice', 'Filter', 'AITran'">
  <!ENTITY CheckRelativeQuery "
    select 'so_ct' as field, @$none as message
    return
">
]>

<dir table="ctpbhddc" code="" order="" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Chọn hóa đơn" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Hóa đơn từ ngày" e="Date From"></header>
    </field>
    <field name="ma_ct" allowNulls="false">
      <header v="Mã chứng từ" e="Voucher Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="&f; and status = '1'" check="&f;"/>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" align="right" maxLength="-100" filterSource="voucherNumber" allowNulls="false">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="AutoComplete" controller="AIInvoiceLookup" reference="stt_rec_ct"/>
    </field>
    <field name="stt_rec_ct" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_kh" readOnly="true" defaultValue="''" hidden="true" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" readOnly="true" hidden="true" allowNulls="false">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>
    <field name="ma_dvcs" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec_ht" readOnly="true" defaultValue="''" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 230"/>
      <item value="110--1: [ngay_ct1].Label, [ngay_ct1], [ngay_ct2]"/>
      <item value="110101: [ma_ct].Label, [ma_ct], [ten_ct%l], [ma_kh]"/>
      <item value="110111: [so_ct].Label, [so_ct], [stt_rec_ct], [ma_dvcs], [stt_rec_ht]"/>
    </view>
  </views>

  <commands>
    <command event="Created">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGgaNRsaJsknSBwkesLBrrlOCVFZDW40yDbAinN/IFqKLLy5dHael4nMohYERT5OBr0CzsR8FubdjVg62oLjYgho55gZA8eVXATjfvxUx8+7</Encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcE7nAJXWJQLfN8YZXvHwV4su+4pQbR73qdLzLgNbslgkEVs1UrfNSDB7bmO9fvZlRiFtP3WpAhkUyJWvk5X0T0Jiax+GjDbWYl4bX43lKNPr</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMvuHjld2HbjNYvptNSMGIKLLwjXRaCSiRzSG3xPEhBhGPxeKfmMJn/zLKbPuIb3SsmkdDDmkBIk6OTL665SH+AR2YkBUvd6MR1KHtygIiJF</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8KU3qC26YeKeL7edhfPrfpCg/YTTJdjFCOs/4qPMwV+caqeC9D3pFglUcmfxyD/mh1Rnamu7G+GQIuQH/2ose1DvhfOTlRo9jGHNwyDa5mry12r/hJurH6wCvwIE5jv+B5aAPF6GrHI6FTBoCLcXBeO91jCWcWTvWyphSNOfA+TZPHyLSg1vwjdsddsWd4psluM7DajUV+q/bYZPBxjxxmLmqru/sOB+7jTXyYAHNUj2mxLF7eYH+q7SrUBlLhMpcPrbuKAjSE4fKngcQ9m9MzUVwBjsLliuqhgW9OfMcbSgNOu6iOV22EHO8PAZQLdbRNUyX4FqIsDJlIkjSK8Daj3p6fif/IQUpiCAIXE5ESD+iHQPZBPwLzqeHR2R6j8+vJoD4foOX8IwwbgOYYsSdem8kyiBdwiybvtq5vveSt/d4onEricZ/HI9/mx3r2OGHKyvMdpVnKADro2RCOuKzr5QESdlkD2fuAJ3bNZ8TAp</Encrypted>]]>&CheckRelativeProcess;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Y/L/5NVZ+RGB2tClLocSNVc7agpn0KcuY+7K9t1dqwY/cQ2/ssbNvS9MCGW7uD23iHCwgjI/kSlx3brKBlzDkj+yp4C6UaJfYK4Lda5O1H9eLcRaWIMDg9/IIUO9qWTjR7GhpyD9yhPzYwi6IWL3A2/lirjn5sF4gDxPg5pOnOtB7RP3nfAi4KRtGjygykecUSxgXdmp6WFV9IIyduc32OTAt2pw01iHKGCD2B6vhvd17984ojyzyxxdowWWNZdZCXkH7xMjuhf3UpSZkM108lNu387Lu1uZHnXyS/vFpAmwT6uqbz8qUewOH/ML/GNPcIGBKVXJng0MnuwDj2RmOWMhsIXXtHJZIRO/6//e0XCMjjszlv+MXEgDjUt2F9oOK+sdfSzeFfyEuexRsVhdpYhlnYu5IILQ3l1OdkPa3wmghK1B78CKG91JB42ypbWAuXrq/zoda0G+73LdVpiB5QIGEYdPJwcJUs47PtkyHr7u07G1LkRwr6EBjLM1kbWP/gijnNreEYHY+4lZILj2LrKK5tBZchsD5gC8qzW0L2S34mIf/gsfo8BugqyaDA3wAOpKvYjouxLGecv6NbEIRbnZX4+N1gWbsBgmWDiluKKxT6YrT4NMjIZZo7qw0AoEYa4rWJdWpy9hIWEaSEQL52UYdohIGSoRmvdcgnb44kabgOZWQtOlDWzMDlQpi/VilvokvL9qXjC42CNGe+8Zl5J3dcsln83MVlODEiT0wVyamIoC+npH0wJKS1XztKd2TRbx/PN2yOh/UI9145a8tFQgrtdgaoS0JY4Yk642QoEw7lM57lk2hqdNBrRpJMBhv67Rp8cEhp4zZYfwymMmQkqC2RW+AMLk1f9B6uAK8F+n0e0CqDuj849pySgeKi2tS/OeL+HSeUXFxCaZiUzScvfCL+XvT24eq9/PiRspl7CLnIOnhbJN0n/OebFW3B90on99CiuujjXiszIhQZRxGGJf2EDw2lUFyBElqGABRZLkvfwYvVM/RQKY5EDBiGbOA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aFHGOekxhQrrYhJvvDN5rEZUuTeHxfYJiOHyfRc6sAW4JQUzgVX+G/95oOVjRCC9B0r/nCu94+B5snRpy6ow20mje+xZEeYs14bGIJYiXr1</Encrypted>]]>&IdleLookupFilter;<![CDATA[<Encrypted>&kC14wA3BGHJ+ACfBdPMa+cStN6w+4umYe5v0XnZqe6V42MRznHZDI2HdyOhAe+6R7fBvbDhbPnGJlxRufgwwg0V8aTWaU6HnKRiXA12znMjBHaJKEVfSXwCFflBPui30bnBLIt2yfDBiiOQppyFWcSw1GUKMmtWkQH3gPrFWXlsCIRMWrV5JVliK2uvaA5oiuZg2aAziyMOetbCobFdtf6aOnzCwDtqC6bDSPfU/Kds19rP26Od8JPpszC6BUAyzyFYBUh5r1vKqv9Q51ew+K6wDZ6yNwMMw4MWrsBn9RXsBB3Ii+8+aS0uOIchSOGop44m12B8Z0W3sivFVWEWPZGYq8PpmiZBIzVxS3WPP3bw1yjGOi+e7Z9GHj8siFWSa3WbMMy/HQpBFW7+Q6boLzDvECYE38lIxYumYJpN5Zopm+4PdLZ5rl3azcmdDnyX6uOwlcPXSA29RZqLoe6cXmoC6hbD1UQWNJtBhlGgAhofGkpUZ4xhQ8J2k2DzHTaWoJRM9RhtpX/K1t1ZZQTOwJK30nJ/yMFcmw8wsfTufX5bAcTTm7AznA4qCs6aq1If1aL/NAlSFpg9BKZltTUdd9vIV5qxQ78Diz5MTgBXRfoR7UK+OQLSGu1jHZ4SR9Aiw82bfcLVGUt+D24pcQnVKJ0v3q7HWvpFE0mufwCadpy6eBOrcMQCmeAcF6lD02DhOA+O81IrVoGC857h35C9kpmnnUoWujbF048B0TrzvF241zaFZSHblr+qcSQ5QTtMNpsLEs+XRuUC+Sq5TrFr2ervjOI9vIXzGmCSVcsLb3Wc=</Encrypted>]]>
    </text>
  </script>

  &ScriptFlowFilterCss;
</dir>