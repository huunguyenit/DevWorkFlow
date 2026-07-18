<!DOCTYPE dir [
  <!ENTITY ToolAndSupplyTable "dmccdc">
]>

<dir table="ctcddc" code="ma_dc, ma_bp_dc, ky, nam" order="ma_dc, ma_bp_dc, ky, nam" xmlns="urn:schemas-fast-com:data-dir">
  <title v="điều chỉnh phân bổ tháng" e="Adjust Monthly Allocation"></title>
  <fields>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>

    <field name="ma_dc" isPrimaryKey="true" dataFormatString="@upperCaseFormat" clientDefault="Default" disabled="true">
      <header v="Mã công cụ" e="Tool &#38; Supply Code"></header>
      <items style="AutoComplete" controller="TS2Tran" reference="ten_dc%l" information="ma_dc$dmccdc.ten_dc%l"/>
    </field>
    <field name="ten_dc%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="sua_pb" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Sửa phân bổ" e="Edit Allocation"></header>
      <footer v="1 - Sửa, 0 - Không sửa" e="1 - Edit, 0 - No"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZfFkdHUJGZRzLddtfeDImmN+2Phhjqh63d2DwsLM8izsEiMb213IzOghlgrzjOv3FA==</encrypted>]]></clientScript>
    </field>

    <field name="ma_bp_dc" isPrimaryKey="true" clientDefault="Default" disabled="true">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp%l" information="ma_bp$dmbpcc.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="ky" type="Decimal" isPrimaryKey="true" dataFormatString="#0" disabled="true">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" isPrimaryKey="true" dataFormatString="###0" disabled="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="ma_nt" clientDefault="Default" disabled="true">
      <header v="Mã nt" e="FC Code"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default">
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZfFkdHUJGZRzLddtfeDImmN+2Phhjqh63d2DwsLM8izsEiMb213IzOghlgrzjOv3FA==</encrypted>]]></clientScript>
    </field>

    <field name="nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="Default">
      <header v="Nguyên giá nt" e="FC Original Cost"></header>
      <items style="Numeric"></items>
    </field>
    <field name="gt_da_pb_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="Default">
      <header v="Gt đã phân bổ nt" e="FC Allocated Value"></header>
      <items style="Numeric"></items>
    </field>
    <field name="gt_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="Default">
      <header v="Gt còn lại nt" e="FC Current Value"></header>
      <items style="Numeric"></items>
    </field>
    <field name="gt_pb_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="Default">
      <header v="Gt phân bổ kỳ nt" e="FC Monthly Allocation"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZfFkdHUJGZRzLddtfeDImmN+2Phhjqh63d2DwsLM8izsEiMb213IzOghlgrzjOv3FA==</encrypted>]]></clientScript>
    </field>

    <field name="nguyen_gia" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="Default">
      <header v="Nguyên giá" e="Original Cost"></header>
      <items style="Numeric"></items>
    </field>
    <field name="gt_da_pb" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="Default">
      <header v="Gt đã phân bổ" e="Allocated Value"></header>
      <items style="Numeric"></items>
    </field>
    <field name="gt_cl" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="Default">
      <header v="Gt còn lại" e="Current Value"></header>
      <items style="Numeric"></items>
    </field>
    <field name="gt_pb_ky" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="Default">
      <header v="Gt phân bổ kỳ" e="Monthly Allocation"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZfFkdHUJGZRzLddtfeDImmN+2Phhjqh63d2DwsLM8izsEiMb213IzOghlgrzjOv3FA==</encrypted>]]></clientScript>
    </field>

    <field name="dien_giai">
      <header v="Diễn giải" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 20, 40, 110, 120, 100, 0"/>
      <item value="1100---: [ngay_ct].Label, [ngay_ct]"/>
      <item value="1100---: [so_ct].Label, [so_ct]"/>
      <item value="1100100: [ma_dc].Label, [ma_dc], [ten_dc%l]"/>
      <item value="11-----: [ky].Label, [ky]"/>
      <item value="11-----: [nam].Label, [nam]"/>

      <item value="1100100: [ma_bp_dc].Label, [ma_bp_dc], [ten_bp%l]"/>
      <item value="1110000: [sua_pb].Label, [sua_pb], [sua_pb].Description"/>
      <item value="1100100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>

      <item value="1100---: [ty_gia].Label, [ty_gia]"/>
      <item value="1100-11: [nguyen_gia_nt].Label, [nguyen_gia_nt], [nguyen_gia].Label, [nguyen_gia]"/>
      <item value="1100-11: [gt_pb_ky_nt].Label, [gt_pb_ky_nt], [gt_pb_ky].Label, [gt_pb_ky]"/>
      <item value="1100-11: [gt_da_pb_nt].Label, [gt_da_pb_nt], [gt_da_pb].Label, [gt_da_pb]"/>
      <item value="1100-11: [gt_cl_nt].Label, [gt_cl_nt], [gt_cl].Label, [gt_cl]"/>

      <item value="1100000: [dien_giai].Label, [dien_giai]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHbu/ZQC1JY+xrgIkDq0o4QaRDt7JI/Uri1Fnq3t3P3dagoXQ/V+RyjkJo9Slx88y9BnDgdaGfi/k+XYo+xSIgzr1oPwzZvMLV7+gr+8vDYAvD9RcTh+9N5tvBZ5hmlSYsMer8+81jRl6swwnbJgS6iksv6ew4gkTWgUTS4JReOCBwEhg2I4tcrtX3iuHM8OQZdVlWd2IN7lsfLwOwZ2+G+75xxgW6NPn3QXU5X80S+BOhEBr/sEI+IQyP/kUAJfWLKMtViSAKNARm/ig6l0D6N8Tst1fWxXLJvMJBWDKd5zBNPF0jbG0EEhtvesPp6dRCY=</encrypted>]]>&ToolAndSupplyTable;<![CDATA[<encrypted>%xlZzWf5PGw1rYvpdobOal6FCWImS15ykQr/L5PD1bG29Uhm8xzEb7g3jzVH1Mq/SX/Qv0v10tL93inX+zfpjKuSqQO8RFYdErN1hXMM49ql4Mqs3/mhBR0pNSAuclk8u/4c8wNLnO4XimFHD2pT0bIP1VheS5PGOYLlqr1ImTjztp4tQo5pyOJvq0oPD52t1R43wicyvOccCZy20pcuZncjDIokES9X1OYRqE15iezOw59a7UxnV7vtMmTYYUqTCuwquH2mFTKltOubiUYwZfG6ezcpbk/q1eNoDDGsTXmz89vjP1ECvS68JmfUzI4Mf3IyNKd152KHpH1ORHgJLjFWZvEbYkib4PoBHhlwlU7+IETSLdh7oH4IVSqhxzf5KZGgTmMKUqf824gHxIiYysq65wz2/dkpf/gPRbe9evt0hv38pxGpjyAfR0gTpuQifa2Zj+bU6uhjVLRBBtBgsfhUbGtcwTE4ubfw2YTnn2tJgL3AoBex/kUhzg7332xqVSATb1Mx+5uYTj2EdAlDMSHv2PFrM1CLJCaugl+1LT/Zi9jFdfoGRR4m49zZmV6iZiK9d7iHssueTDmLG80hS00eDwUYeD25/KVlA4wjgKDax62D6IanzQgHowZbAJ1hTNolgNxd2rnHBNAxmggKajzXmrzVwma5ZOJArRnKj9yQ=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5znaRgTZe3bl7siNb/t/T2FB1rL+criLZyp/28sEGV47ni0ozcFm95G/oPL18tRTzMZEwPsIN+p7x5Xi7EFwls=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeoa0w+CPb4N3csANl6HRMO9RdATaDRakAgmtq12tCl6KasSZgYvgb5EsFAoVlB9I6Tk3ftUrAu3noEZrPn5YWXY=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KXS4vuR9ZD+wIst6qi7fjmYIKiqOFrdmMr9AV2A4eI8M32W1la5j9/gKeXKKAr6LZmH+j469WRsFYITZ4OD1L2jy6E2Kgr4Lh/6FMt/c6ZGKSw03ZdR6DqUgHOTYBmJY8nfZ8tHHdL5kPxVatPV/p6LIpoyxyQVSlH2+vROaeVf57AKb6EWZdSPeKg+h43JmBBX/VspmTuK2xdlwg0v46DUyLImyDLENotmY2nRUCqySZRXjUyiXInLDd8SQILYiqOXIn92Jty3NDrOXgg4f0n4PgHvGehenB7dPQK2AwQXBuyuXC6oXC+tKTYVUgEArarmVrxEeC95x1F18rQBxRbdFstXwGE2ri4ZGkTZZ9s7vdsFxJG19RUxLEWTX7U9kuicHjJxpMrjQATwyuqCwva9E8/X59wKZg9ewacZe0DB2fAeV2/art7BosLj/cWr0XT0CEvT2Iai4S8aKwCFfZRSKjxQzbmk/xFUHPWAvaZWSYBrnUmH36iNBThKTkRiZTDyk2iEzjmIyRAFTrq0weMGrK8k993YEuRFTxoQ+j6KXomeyW30wGe31NV0HI7PyLjpHZI6l7TES9zMPIl0E2gzxTW6TSlQsgtwoa8GGbrnBVYIt2oI9W3z7DSyLzZGPK7EVFZeXKLSwjv6e/meUd/eQeX0TWEKygu4/WMd0deOlAYmSCxBoZV7l1DbP1aIN2sa/xqJnj7/7clA0xM8USJjS/l/PRMhDml1BLn5cG/Q4Cw69Q4+8ckcrmP1be+WLNGUTCcR4p2gLYPl4WRILSnm1yadqRJeoNLDtyxV+40/srYn2yZJY6HnmwGJk8JWts0Ab52rNmnCDzUY0OF4ZwIYcPbkneRgMtXr5jJnER3i9uBjD5DkqVUTxfabKuFQsaJzMME63sW94IM2PVWt5SVFBOyHAtw0tTsAiaqwH7395muNYbdNdFwvxKCkPr0BUtQPttsBYMdai21TakHD9WQVXjn0eLXINp9HXbnqknDMUh4Uahfx9ZKYm5Yew35iwrg0PgFMz5ia22p+6kzwnYBs+uWITmnvrt4ubkOZMHwbWJ1tcaAfMmxrOO9+SKOcsg==</encrypted>]]>
    </text>
  </script>

</dir>