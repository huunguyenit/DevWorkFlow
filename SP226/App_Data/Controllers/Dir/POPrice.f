<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY % GridInitialize SYSTEM "..\Include\Grid.ent">
  %GridInitialize;
]>

<dir table="dmgia3" code="stt_rec" order="ma_vt, ngay_ct2 desc, ma_kh" id="BG1" xmlns="urn:schemas-fast-com:data-dir">
  <title v="báo giá" e="Information"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false" clientDefault="Default">
      <header v="Mã nhà cung cấp" e="Supplier ID"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (cc_yn = 1 or nv_yn = 1)" check="cc_yn = 1 or nv_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default" row="1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_vt" allowNulls="false" clientDefault="Default">
      <header v="Mã hàng" e="Item Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb6gfR+1VS8cFvVsKwaUsfH1WszU/M0Ll00yCd18Z6W8Ng==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt0" dataFormatString="@upperCaseFormat">
      <header v="Mã hàng của ncc" e="Supplier Item Code"></header>
      <items style="Mask"/>
    </field>

    <field name="dvt" allowNulls="false">
      <header v="Đơn vị tính" e="UOM"></header>
      <items style="AutoComplete" controller="UOMItem" reference="ten_dvt%l" key="ma_vt = '*' or ma_vt = '{$%c[ma_vt]}'" check="ma_vt = '*' or ma_vt = '{$%c[ma_vt]}' or (0 = (select top 1 nhieu_dvt from dmvt where ma_vt = '{$%c[ma_vt]}'))" information="dvt$vdmvtqddvt.ten_dvt%l" normal="true"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4wEy9blkZN1+vdlKCGTxReYbD7Z3qc5D/jwx3VLNSIPw==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dvt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false" clientDefault="Default">
      <header v="Số báo giá" e="Quotation Number"></header>
      <items style="Mask"/>
    </field>

    <field name="ma_nt" dataFormatString="@upperCaseFormat" clientDefault="Default" allowNulls="false">
      <header v="Loại tiền tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" normal="true" key="status = '1'" check="1 = 1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" >
      <header v="" e=""></header>
    </field>

    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" clientDefault="Default">
      <header v="Ngày báo giá" e="Quotation Date"></header>
    </field>
    <field name="so_luong1" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Số lượng từ" e="Quantity from"></header>
      <footer v="Số lượng từ/đến" e="Quantity from/to"></footer>
      <items style="Numeric"/>
    </field>

    <field name="so_luong2" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Số lượng đến" e="Quantity to"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" clientDefault="Default">
      <header v="Ngày hiệu lực từ" e="Effective from"></header>
      <footer v="Ngày hiệu lực từ/đến" e="Effective from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày hiệu lực đến" e="Effective to"></header>
    </field>
    <field name="gia_nt" type="Decimal" dataFormatString="@foreignCurrencyPriceInputFormat">
      <header v="Đơn giá" e="Price"></header>
      <items style="Numeric"/>
    </field>

    <field name="sl_min" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Sl đặt tối thiểu" e="Min Order Quantity"></header>
      <footer v="Sl đặt tối thiểu/tối đa" e="Max/Min Order Quantity"></footer>
      <items style="Numeric"/>
    </field>
    <field name="sl_max" type="Decimal" dataFormatString="@quantityInputFormat">
      <header v="Số lượng đặt tối đa" e="Max Order Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="tg_th" type="Int16" dataFormatString="###0" clientDefault="0">
      <header v="Thời gian thực hiện" e="Lead Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="he_so1" type="Int16" dataFormatString="&CoefficientInputFormat;" clientDefault="1" hidden="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="nhieu_dvt" type="Boolean" width="0" external="true" hidden="true" clientDefault="0" defaultValue="0">
      <header v="" e=""></header>
    </field>

    <field name="cookie" external="true" readOnly="true" hidden="true" defaultValue="''"  allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 120, 110, 0"/>
      <item value="111001: [ma_kh].Label, [ma_kh], [ten_kh%l], [stt_rec]"/>
      <item value="111001: [ma_vt].Label, [ma_vt], [ten_vt%l], [he_so1]"/>
      <item value="11---1: [ma_vt0].Label, [ma_vt0], [nhieu_dvt]"/>
      <item value="11100: [dvt].Label, [dvt], [ten_dvt%l]"/>
      <item value="11100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="111: [so_luong1].Description, [so_luong1], [so_luong2]"/>
      <item value="11: [gia_nt].Label, [gia_nt]"/>
      <item value="11: [tg_th].Label, [tg_th]"/>
      <item value="11: [so_ct].Label, [so_ct]"/>
      <item value="11: [ngay_ct].Label, [ngay_ct]"/>
      <item value="111: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="1111: [sl_min].Description, [sl_min], [sl_max], [cookie]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDHwyWdnnAsOePGxNOFkX1ewSyAc+svPhsdOm34OGLoTsvxlQj4KO0w8w4fhS/DCRdzsMLaw282IgJF4PT69xmZ66OSuQdGul0DqWFwoK7Ma</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDk7V+WCQCbTf5mLypqZov+unIhqz16NqKiY8U3Fhav2LArhxOunZNfcn/FvGmsLv3LiCvis11cxbxSQaqy3kmw9o9g6ufJWM4vLf4R1G5ey</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyaVpCbdGljJ0ivNhQve8w/EiN+aWtLRfyeyboE8ERVKmOAUXxbksCl2ePc8ucuLCpUhUWldC7cI9ET3WqBxJENWg2O/npghILi/olxVxgc39o3THhNdhVcv2wDkLmrUWC5yb3ogvCG4P+P/Va+6+TICPsW4Mg6mvaT6f3oGtir5y9sPwygrYB4Jg3RcxL0TEGXcdKDsnLQQ57RHsTANPMFMpdIefipmfCJnklh3KAKuvAfMjtWSctJB9VSp16VFT9WfOkpiBejuuC/ZKGt2txc=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFLTtxwxLS0qUVnguBBCPvNevLYx+efMXQCHN6lThCm8mmkMEFVYakPFPHsBP0QKFvdewFWcK6CuMfwXUa8IU3g=</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4oIzzwbQpRDIMaJrvXIVVy7HQQ0bK7vOgLkItwoSlH1ITGTcrOmDtiJgLBEOOyk9aBlbLRjs3oZeOFwfrVMY7Z1jKlVxOA6+0fzxdSB0/yClWWxKX+bY2cefcZEUe2mz5NzZSOMG2XUd+q8XjSyLBhTiK2AJC0k8KySAbGdo1ZpZljV1hi1Qhco9wGADyU/1RNAXM8ZD39G0G8TiMhQt2LJm6GSfVX7soUPHW3Nv238HdyvoIM4BJ6iotOUfzhpHWBWktTL58ZTp8Lr1i3NGyQGCGeo705+ICZxFHxLJ2sOM2bijt19YHZ8TDdONt8LlQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+7JjemY561Ih4gUrejLDDKTMdH0lVbY0bem11d5egNK2xXpL7mbjqN318wUfNVCxM20UJmAeQ3AL2k2gIr+BAxjF3WsMrHrl6awR4yDROFvrqf/r56qVz66Rvh2juAP+mzKj80olqm7l0IurEEAzqpURNeJhPzzt1LWjMPDUiTG9Hz0BAuQBLh6vVK7apwfc6PW8jXz6C+hr7669/kT701k6IX32o+R+2GoOt7MtQsEbXYN5o3S4E4P8O1s7oPrj3IiWQ1hSkjY9E/iiD980XejEq9jJRZKQxoFJWZ6omN2hFdyF7GaudusiGUnxOHyyQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIqJooHwZPI80Wmvmq/1Zncywir/jO1KZHjku3hLM1jviUCbwc+kldqJPsUG9C0t/w==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8ctXgb+8D1oU+itM1tUg7V0U586O1YpdlDS+j60sM7KHLRgTwYkp7vSNvpEbYrPnEx/U4QzaCvNvC4Xhb1eEFAf5F7xbj/YoOQDqPpZ31KMiyNgTokc9sho+f+bEiNbV4xxO/9iuPfxpF2ihSHOBX3VMHDyVfKBrtWEwnjRKU3hDcnSGYtGTUymuPR91sxLQEE0sD7Wjsp2cPmsxsL2QT6</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV5wJkBm9H8DoNsAtSDkVzi5WSCpa4j1oE9getxOsIMcIL7aWhBMlx9eJLkrEZt+FBA==</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EcDIe+Zgaq9K5PJOweTML4VVMUNnwPDObBxrh5TSAZzR8fCmqYQyNhX1CCZ9J3jXTkC5fmsvqgeInTGmUKCIzDtqRmSpiuXWxAq215KMQtE3nIi5orBc+u04sEgiZwmUNjA36MJuZIBB0R/5Ysu1QMHBcEWz7s4sGFs8aWDUtjoVh4Fmbm/3Cr8uRtZWwViB3ofQvaF7kUwxSASCEhhtw/07GQNrlPbE33Btr3DOTg9kmDq+WoZc+mT5A6lv90p34SQMpAmtkJ/yVO6m71eRX42MvlBUuBkEGfXshgGayEDg97O8fXzlANbKBwV0uKZC4TZeDaspc9B4bqm9V7PUBGsmyDi0Di9Pd3RRb4kpR6ZfzdDzMoMiHle0oON5KiEbgQjjl2vWOcQmeTi2CftTvVkrzrIEmkYsi0V//5QWm7QoProUwcaGNla5vfghTHE7lEyWi2EFUPAX2eh0unhPt7uHYu7iwPTddMoNxHy8jCIK3w8WnaqskLFFFu1NxGHX4CxyQlzV3tTyoD6Ub9rCMaqqkhVDNZbhbBulnzgJspQPHeqMKzR4cEBqGqP8C317osgLxE4CB8vE/k/t+0j2ixbEev+JIN1b8cgrbSyr161Z</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtfFWO6Km1QDF1F4OerTcOxX7dD9/mZ2WtE0JWesUOEDWCDH5VV7xgdoxxD+vtcxiuBiKrxXMFX2SuNLRJlf1WMgV/QCuB10s2IAZtWYPUpvAKPnranigWcmr4seElZWbj2Xj5AylAsxGNl9a8HI8lq/sDq5Zhpn29r+2q8HVPTqIsK/QADv6RoFOn+6ho9F7wpUu1cLLAGVAY2/GSZXAMkSzJ8cuU7HfLodxvwhRyiYjKzU3O2zchRMou/mjhkaX+Vu+MJpocIKuV99hucwszluugWs11CsEUVXc74DPC00fbiWQ2y8NU6vU4+bIzCL4LPt4okUv25Np40xn4tp3knxxPCblyT0aopPxwjuZP3Am3FZSQAJZ/TL6ryPJX+hpH+jRwwxi736kRmm9f05yYiNawnt/CmrJmUKu8asYNF+QFbZdJq7KJcKVM8aS7jEYMedk0ptEiQGxYGBoWhC/wLXMrfJP8TNB321Uq7F7e8l0bzKxjoIyCE0TCncMpWxWw8Puz1M68dPJ1r1SUP6t/EPBBpVfdQlJyxgheuXBkqEGZp6iSldlF1HzRhVAYdKN56wie34fSsepFhmbaUyekLco1p+y60CSbk4YabKevnV68+VmB9pAmOfF1aMc/Mxof2sE7KA05U/SOfYJZR94k03Cl39JOuSQ5lYYUTcaXjXbp6zWJGb7x5vBi12bT5xb+VSveYWlKOsLdxjcuYmoQgE=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp076XKHhVBuj1sb2lc1sJyxFPxsCkoHcTnyPTQB3pj14fW8NboSqqgymM1/faV8J4td4G9D1pMRIxSuQXJO4gRHI77HkkL5OOVdpf5vkiFqNkQqPHkieFEfSbohLdJWhXce3PzajSmiykAha+lTWMP7Ggem7bujHHhNLepABoK3otccWlI82Yf7bd+jFhygWWUi/DFhDVOJX0IbfPRzTDqI5Q==</Encrypted>]]>
      </text>
    </action>

    <action id="CheckMultiUOM">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7OgXRUOS55f1qZWUcxbp07xjL/Br9NrJ5Iessfd6nr8V9fRLiJi2pchWVGpLMZwMaZjLoDgokq3sl7A1hhnK1ICReMsQDfqW97AOqpfZCKKUsJV4JXvvlU3MdsOpHDN3KSX2yP3hA92dZtqm3fBYi8AR922SwVCO7OPfzqmAV5DqPoD96fBwucfs9yvDOFxLs=</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>