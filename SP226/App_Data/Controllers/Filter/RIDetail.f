<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptFlowFilterCss SYSTEM "..\Include\Javascript\FlowFilterCss.txt">
  <!ENTITY f "ma_ct in ('HDA', 'HD1', 'HD2', 'HD7', 'PXC', 'PXD')">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<dir table="ctpbhdtt" code="" order="" xmlns="urn:schemas-fast-com:data-dir">
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
      <items style="AutoComplete" controller="RIInvoiceLookup" reference="stt_rec_ct"/>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcO8VkeyX2WqPDd65HKVholCLj5dGaPJVXMbaOhfCxxduDG6Kroo7M9RakdMXwnEy0nTDT4KNtb1JsAIVdyfTT6W3jM1Y3ICojYUCeo3FUpBr</Encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDFAmuF9CV/5C2+/3UyDWbY60iI6gqwRqfeAbCbqDpmYpENRt8WFX8Fg1EmW10K0KLLc7Zc4JoWMjri4DW/rB0fO52SgwgQ4Vs0kWTlB8cGZ</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLyofF+eC23epxroIvlwsdguWKp71bX3mtUghh2GgogqKJeJnc8BvK3legVeiJ7SjusUDJlUO1WDjW7s/lNoUMkXRDVd4Pxcjp/RwTV3DXDk</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8KU3qC26YeKeL7edhfPrfpCg/YTTJdjFCOs/4qPMwV+caqeC9D3pFglUcmfxyD/mh1Rnamu7G+GQIuQH/2ose1DvhfOTlRo9jGHNwyDa5mry12r/hJurH6wCvwIE5jv+A1gka9rfUG+S25IbnC5aW1faMKFveBwtVrLefn6582r4YrVNywbm0SqZPFO9jYfVhdCHAULL+cbN2yA17S1tfaPyXcZ22R0t0vCF9qZVEqVqbwCPrRwLpGrslsDC0bItJjkElg6lP9zvbNJq9Gx7XkltKAzUVOwZKhN72dTstHNX374DdCpOpzg3qdmbdlhACkKxl96GcL1cl644jy3Ze5Yeh3gxBXGGQTmz/6NRbYiwks3IYRp2TtPW4h2MqHSSxrKqwYs/wFw1zOAoVz+6XSUgrLiSPPBrHixwSphaggVZk8Yd2NKDgcdcdaE6YvplliSmNe4aqrggS202H6S51r76cChKUfAIBrjuoBDCg2Avxva4kCr6ESVBE3erxAqpSpCp7KpcbTyySF+pkyt+1L64nL5dXFaUtEMRaFoiTp+/EilyJ8WCsHnjVXrclvSI+gQYyeGBIJWwq67A6TNBPTBa5E4L4YZMHAXc/LQSI2yUjCoQyzI+OPw/dCbF2feJRosydtKMuaATDGH1DA+0wBqqRZU2E3jBbeKf1wFrRU5CN2yktRu39nKaw4iMC4Dcd32N8tT6OUdhGSD71C2wt0RwSq8Mb4cXiHg0J25Tu6TEwD3dXyfTy70GyEo8YuF4+bal0GyVvAT611XaV2Jj9pbGPjV6VKZLKsZQXhTf1xTJyqYvPI7IuLSRogtZlBJbZ+JA7NKeRB0pLUbhzDg5LPSOWEUgnV2/dmvbhn9dwOsn6ydqrw0OgB5QjCALLjuOLsPF/8nAqssM8IMrkv3EpsUc2ZXBw+/KUZtNwUmLf4VePDP3usq2sYv/lje0po55dTmfH9L4sw74AwSWLvym4vvpHTcYU59+rawoRBCysVED511Dj/AjhzCxA5gvgpihsq0DfPvkyff+vRrrpKXt6/XSahN+tcgEx7NwrXT0pOB+LiLD1Dja05gD+5uJGNBZA1gUAJE1Dwk3xEEQELhwWWORUrwOxf/AnZ89d/Kxtn/8B9NbSlBqnFI/954t2nEghxtkVVMJaDxr62XXou2yn/XEtlQvbH/apK/4IFcomHlduulvuNkKtQ2Owprl9q6iJgA6hoq7d1DRB4hCbAr6LT6/BfZh/DH/E9ugmwgoqyZ6gQhuLQbNoz3bmGOnnUE/2t3lVul+Vx8WcGd6MFKfpv35PF37AygoKIr1dGqIxEH7JOUF9RbDF8NgPoXoZozqgDgyIjHAkGNAzFWOuGXBXaEwPYc/YiQwf70L/usHbyLWaqK/D1W2o3iA53kOXEaUWhF86vvMWEmL1otrXacQeo+eyLvW0S2keqbtbx3CqguS6o5pnTj+60T2fsnsZdNr2w7ljaLJ2xee8jGNTje/B5nmJRte8NncFOiqIG/+pF+XBKPEOL9xHSwYQzm2hfHP1I79oqLjm9n6/hZwaKPWjYhZdKOpEd+I1gq4OVvJcIah0tY2zoRthz+FsAfUbhoD247CN0UBABszaw0Kw3aMXRPC+dDfrG+4+4S8WiYZSQVUpR5TU1s1LH0kvy/YrKw3JohnxA5NCtGWbMMkPs1Q0Qyv9k2XHoknvuWYmEGU0X6/30t0bIVPshNJ8sJY690IMdJUIYlM1a31YQFctr1yec=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Wa2/DQq2ZRJQWYEXmsc342bwGL41nWxXpb8nSaPUY7sCGIuRl4LWwqp+rz3RwYkY8il4Yl5SX+dTOnCrFR+j1d9ZesRpXb+VWGurfoEjMw+</Encrypted>]]>&IdleLookupFilter;<![CDATA[<Encrypted>&kC14wA3BGHJ+ACfBdPMa+cStN6w+4umYe5v0XnZqe6VlOqTNVz2VESyxEbUnS3Y/y8PCVjClciE2LRJVT8UJ+0jlCcdsBVR4oM9G2fZYoaGU2daiIveKHuEvmUscOH45+do9qra2Kz6DZ+6C3Fl+b9CpowOitN703hts7mR+KPXJhSTLqQeouX0HMB+EVQesyGRTnaJ02V20GnESOIyhUvV1ZzbfDrBFOWh0O4d55h8ITJQc/jftyEpsbq3BtgZGMURW2FIwDLYoOLenKxu9DKnVNV1FqeywGfpSxvXW8gi2P2qKgv1hHILC6RaInHRx8Pa6nLcLaXG1GtHN4BsKNQvRGtbo3gBuUUhOBwbZoHEUIel8KLdB2SnyU9KpamNhdnafM3Awd6t7NF7f2d1mIQ+ntswKq+OaHYOgMflM3ZrUdRnMkcUFgSd5f9NO3ST6sZM2jCl2iQ4so0qcIvmdqzFWmGc3tD/0yAqUHrnUkKYuRknRqiS4+1siEwhjeDdom40WBtpUg2TpspvJwYnMzyB6MIqR5tPO8+m9T30U5OiPSOfT46Ye+KZ9LjXtc/JiiA9cZyJhSHwNLYz0aZGeADblMoa9ZvNKHR+hzocXMUU0WdEY5+lBOENr60nJo5AJGi8ozCg8b5nNrkq8PwrVhxzstLVd6hiRR0r5+DTXy/g3yFEVSRIBd+8fhUHpK66wTCMOal6cdXGa4Ls7gSDTipaIekTTL6MkdPO07+WXDBDJ1gtOJ+yZkch6Nf/DuXpj9ci/lYJ8FDmc7p0XNQ805OfiQI0KpQb2FaOQXilxhVmO3stngSSp+DOUrtlTfze/AakSoAIytlaAjAtaeFMShw==</Encrypted>]]>
    </text>
  </script>

  &ScriptFlowFilterCss;
</dir>