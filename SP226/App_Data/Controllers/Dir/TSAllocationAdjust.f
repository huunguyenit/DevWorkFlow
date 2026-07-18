<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY FixedAssetTable "dmcc">
]>

<dir table="ctkhcc" code="so_the_ts, ma_nv, ky, nam, ma_bp" order="so_the_ts, ma_nv, ky, nam, ma_bp" xmlns="urn:schemas-fast-com:data-dir">
  <title v="điều chỉnh phân bổ tháng" e="Adjust Monthly Allocation"></title>
  <fields>
    <field name="so_the_ts" isPrimaryKey="true" dataFormatString="@upperCaseFormat" disabled="true">
      <header v="Mã công cụ" e="Tool Supply Code"></header>
      <items style="AutoComplete" controller="ToolandSupply" reference="ten_ts%l" information="so_the_ts$dmcc.ten_ts%l"/>
    </field>
    <field name="sua_kh" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Sửa phân bổ" e="Edit"></header>
      <footer v="1 - Sửa, 0 - Không sửa" e="1 - Edit, 0 - No"></footer>
      <items style="Mask"/>
    </field>

    <field name="ma_nv" isPrimaryKey="true" disabled="true">
      <header v="Nguồn vốn" e="Capital"></header>
      <items style="AutoComplete" controller="Capital" reference="ten_nv%l" information="ma_nv$dmnv.ten_nv%l"/>
    </field>
    <field name="ten_nv%l" readOnly="true" external="true" defaultValue="''" >
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
    <field name="ma_bp" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ten_ts%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
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

    <field name="nguyen_gia_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="Default" disabled="true">
      <header v="Nguyên giá nt" e="FC Original Cost"></header>
      <items style="Numeric"></items>
    </field>
    <field name="gt_da_kh_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="Default" disabled="true">
      <header v="Gt đã phân bổ nt" e="FC Allocated Value"></header>
      <items style="Numeric"></items>
    </field>
    <field name="gt_cl_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="Default" disabled="true">
      <header v="Gt còn lại nt" e="FC Current Value"></header>
      <items style="Numeric"></items>
    </field>
    <field name="gt_kh_ky_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="Default">
      <header v="Gt phân bổ nt" e="FC Monthly Allocation"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZfFkdHUJGZRzLddtfeDImmN+2Phhjqh63d2DwsLM8izsEiMb213IzOghlgrzjOv3FA==</encrypted>]]></clientScript>
    </field>

    <field name="nguyen_gia" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="Default" disabled="true">
      <header v="Nguyên giá" e="Original Cost"></header>
      <items style="Numeric"></items>
    </field>
    <field name="gt_da_kh" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="Default" disabled="true">
      <header v="Gt đã phân bổ" e="Allocated Value"></header>
      <items style="Numeric"></items>
    </field>
    <field name="gt_cl" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="Default" disabled="true">
      <header v="Gt còn lại" e="Current Value"></header>
      <items style="Numeric"></items>
    </field>

    <field name="gt_kh_ky" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="Default">
      <header v="Gt phân bổ kỳ" e="Monthly Allocation"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZfFkdHUJGZRzLddtfeDImmN+2Phhjqh63d2DwsLM8izsEiMb213IzOghlgrzjOv3FA==</encrypted>]]></clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 20, 40, 110, 120, 100, 0"/>
      <item value="1100100: [so_the_ts].Label, [so_the_ts], [ten_ts%l]"/>
      <item value="11-----: [ky].Label, [ky]"/>
      <item value="11-----: [nam].Label, [nam]"/>

      <item value="1100100: [ma_nv].Label, [ma_nv], [ten_nv%l]"/>
      <item value="1110000: [sua_kh].Label, [sua_kh], [sua_kh].Description"/>
      <item value="1100100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>

      <item value="1100-1-: [ty_gia].Label, [ty_gia], [ma_bp]"/>
      <item value="1100-11: [nguyen_gia_nt].Label, [nguyen_gia_nt], [nguyen_gia].Label, [nguyen_gia]"/>
      <item value="1100-11: [gt_kh_ky_nt].Label, [gt_kh_ky_nt], [gt_kh_ky].Label, [gt_kh_ky]"/>
      <item value="1100-11: [gt_da_kh_nt].Label, [gt_da_kh_nt], [gt_da_kh].Label, [gt_da_kh]"/>
      <item value="1100-11: [gt_cl_nt].Label, [gt_cl_nt], [gt_cl].Label, [gt_cl]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHbu/ZQC1JY+xrgIkDq0o4QaRDt7JI/Uri1Fnq3t3P3dagoXQ/V+RyjkJo9Slx88y9BnDgdaGfi/k+XYo+xSIgzr1oPwzZvMLV7+gr+8vDYAvD9RcTh+9N5tvBZ5hmlSYsMer8+81jRl6swwnbJgS6iksv6ew4gkTWgUTS4JReOCBwEhg2I4tcrtX3iuHM8OQZdVlWd2IN7lsfLwOwZ2+G+75xxgW6NPn3QXU5X80S+BOhEBr/sEI+IQyP/kUAJfWLKMtViSAKNARm/ig6l0D6N8Tst1fWxXLJvMJBWDKd5zBNPF0jbG0EEhtvesPp6dRCY=</encrypted>]]>&FixedAssetTable;<![CDATA[<encrypted>%xlZzWf5PGw1rYvpdobOal8gJoAyTP8ne2+qvIJjQD+dJesRpBgPi7tv0zJ+jlkGI+skbCy+yrKujGrBTMzuz6My68ib89rwBA+8SH5i3OGZLWLRvbLsjQq/OZ3lx0qCjU3K4Amg8ZoziEjXuAuFH/Iqkyqmpl1oFkJeEADRUwwRZ4WHiXkLxFFDVeOOxcyNQNriFUgPbWcSc82UHYR+dBWXcczb3A3yVQMNHnbInkqYGbm5d9cMUfgocbk8gVJDGYhfGk+PYThTMmMshB+KHfc7PGFLmdIR7vJF42zDHs4y48Lk6rwufMLbyzUiIaTPuY34PcP8gxfRkZQSk/wiZOSCUClR1I3oHnO3K4uw74KnqV7DFrvGNbZviyQlpiuCChCglKXsb0ZIxzCiT1WW8SK67dBvREWwxlarebxyhWXmHA+XTQLPROW4mHSxEVXu/BR5j74By32yy7Wdf4W2xp1ZIjyaFt+h4PGDcxtB8o7h2FntgYiETQLDCOb5gvncwIwxr4amjClsUcl8WXWsYnN5xIIj+enUB3WHY/VVC38VRMoxicpt1h5QmbA9i+dk9YyWQmklddAeRy/wx81kcc5kh1WXmvqcKwII1fRimYP78wTcRLtQwbRXc+2QqZ0SXIZGAt2bWE4cSIoKKUDj8VOdEeix713iajceEhpb79CU=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeoa0w+CPb4N3csANl6HRMO+yhxTpxpzWbw23z3JvMhuUn8yV6co9x181vbGooxrW6EL3kKZs/26iYBOe0wg9vGOKAJoHHlCJtmSQsn65nEv8</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KXS4vuR9ZD+wIst6qi7fjk/zK/praF953il6ICJ+OBrlkLe8lBhl8RGdnoGniZHEIC9gqo8nbMNV//fW7R1cnJ1VLZycMedmSxpfNRX/SxrR+qf44SmHNoW1JKbgG4XHupXX+wuim1c1sgE7/N0KTVeMb9Pf72z7VjxG1sRCQa7nWIcRHLNUGzFtBv0pI/KuCQ0WS9NrkMS9MmenR3mEvy9ZUvrol4tZN+ZEAuwW6Tdu2FH2001m9SYKkN9bPMrgSCCeKR1gLYmMeDCNWdV4Udndz9umDqaDf7eD404V2fJeE0SSttfW8Zd3WkHYYYdbHacHFNsXb+/5Lc3JlifexZIjfhkpLjabEB9TClOCdrulI9vZ0XCfeh1e/zrxQHHqypQFcEzyQ6ghJTiIZj8a2KuQWGqhRAGihGWVep+dska1rCfnpAjxGGbELVtwHTpUduuLLmUr/LRBGeubZ0VYusfYKRtzOA2yrb1AWNbtltvb1jzFWi2FI0XhRnI6p/s1bMBGpxiLLbCDmkpCEPdpxao2SEKqwDkYbNrCX3qnr9mOeBURnvHzv94zbZympd5H0LSxt4kGpZNyJv7HMM8MfL7ovLHAXNnHCMrQ1HKIKC2cE9bVPEvZcDMS3Xys0yPGAh+0cg5hmmPW3EtPaZLVGM=</encrypted>]]>
    </text>
  </script>

</dir>