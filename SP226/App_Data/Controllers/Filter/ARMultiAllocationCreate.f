<?xml version="1.0" encoding="utf-8"?>

<dir id="PT0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Phân bổ" e="Allocation"></title>

  <fields>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Create Date"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZfFkdHUJGZRzLddtfeDImmNsainqmNq8Clo9JQTCIfwpun28GRKa6EFya3mztFcY0w==</encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>
     <field name="dien_giai" maxLength="100">
      <header v="Diễn giải" e="Description"/>
    </field>
    <field name="ma_quyen" onDemand="true">
      <header v="Mã quyển" e="Book Code"/>
      <items style="AutoComplete" controller="VoucherBook" reference="ten_quyen%l" key="status = '1' and ((ma_dvcs = '') or (ma_dvcs = @@unit)) and ((convert(smalldatetime, '{$%c[ngay_lct]}', 103) &gt;= ngay_hl_tu or ngay_hl_tu is null) and (convert(smalldatetime, '{$%c[ngay_lct]}', 103) &lt;= ngay_hl_den or ngay_hl_den is null)) and ma_nk in (select ma_nk from v20dmctnk where ma_ct = 'PT0' and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') &gt; 0))" check="((ma_dvcs = '') or (ma_dvcs = @@unit)) and ((convert(smalldatetime, '{$%c[ngay_lct]}', 103) &gt;= ngay_hl_tu or ngay_hl_tu is null) and (convert(smalldatetime, '{$%c[ngay_lct]}', 103) &lt;= ngay_hl_den or ngay_hl_den is null)) and ma_nk in (select ma_nk from v20dmctnk where ma_ct = 'PT0' and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') &gt; 0))" information="ma_nk$v20dmnk.ten_nk%l"/>
    </field>
    <field name="ten_quyen%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
 
    <field name="keys" readOnly="true" filterSource="Infinite">
      <header v="" e=""></header>
    </field>
    <field name="kieu_pb" hidden ="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" hidden ="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="size" hidden ="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="ngay_tu" type="DateTime" hidden ="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="ngay_den" type="DateTime" hidden ="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330, 0"/>
      <item value="11-1: [ngay_lct].Label, [ngay_lct], [keys]"/>
      <item value="11: [ngay_ct].Label, [ngay_ct]"/>
      <item value="111: [ma_quyen].Label, [ma_quyen], [ten_quyen%l]"/>
      <item value="110: [dien_giai].Label, [dien_giai]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwetFxBFoPILuYbQazwN5csi0XC1K5j49FHaCbA4FpNPToAH+b508mYSbfzhjTD2c2g=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx0TKzd6yL2BlhLuCXsLiYLDNkbb3RpRzNhIUriN+Wor1YZS+9raDRffKFtIJsn5CJ8NBkCN+RJLYSPw9sY1DOE=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XHr/yZgO9BS8mxonQy//dVgS7fmWrOpz/ITJjMsw7hBuF1hk8xblVVrIi1qCfvMb54nu8ZMlAqBSWyuJ2BAKkuXIDw/x51f90VRq/hHPT7JBjm+Fof7Hfx2jdgZB7ZnRV0vYQ8CNTxGdo15wE7ZmSKu9KCpTBsWiFvKqr8c+nzOZ6qnDasj7tWinMMd4h7B0Wgt6q/7biYHNEGh7w71evDGUDmJKc2bo0/oWEmT3r967S/XJKc92LLb22Y6AXN7AqxtowNMPAo52es7TNZdV5bJwOTRd520HasRj72Pi/XTycmZxVvH1SsynhT6w38XIcSXM/+DIrFoZd7fNcYhY2E1gZLShJAuJuF+XVzqHEtCihxzJLtvhfMUUeVTZZqs4HsbednYwP0+tIM8vWDLRQpmVwIRGeQIx9PYiKhg7wR5atZkXVvIIkZRSt2qFSWyA4nIpqw8qoakiq6IYofRedqoA5FWW/iObmfK88UN20j6c5Lrd+yrw/wLFXAKEaMdGHxlW7s2lcdyvsZGmm1ig1OI39GENG/xzITOVFQ6lEEqZ4O4PU7vBakdebRwNMq+y/24pG0z28Y9LCSQpBuZWemX3gWuAXA09I5iMfhPduC2iDsE6AoiECPTgWc0uk7v6CeJYLo6sf2kBtsumzRi6BNwQ+gEMm9rFB2Y5Nu0rI2SCMo+V2xx2RDaZh0cit4HJAcsapSLJ+6zLMFoHDBAMlJlNK9fb3NvBxFI0pprG0mRgEgBszSXR9d8c2UcZX1w4WAlQ1UXXJvPSabArlSZVj3u9MvbQCVHBz7uGipuTMSbwaDkyzCOWYxLnEGKqWS1jjEWMvA68tITViycCBHXbM6NHe7eqh6/MQP5bEQygabm++CbxWdJQJbmI4Y+U1Fhrt/bGXhXK3xy9ds5jdWN2uP/axAHJF0A2wRql/DOVt/0f8PXQ0pKUmfYBrTdsmnkdYEO91oMYfLe36yC9ZiQtfKStY7OOJ5yqY7bOS+DdojfwXDk5uv0524Fu30rTJlNx1eP4KeA2/1a9RuXRZnCWC2nOE9yvCtyhBSidE5oyJMjDrqs3kUI66pgwBqHuSdf7g==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkZ4UwdHzCv4M+jzUjSIKWJG5tBV+rFhfaAyk4RMpjapHviQ8cwdR9EgUoigDlZb/QGJAe+jS5iFBdxJpbojf6iovlf/5MJYpKFtREjPdZ43OVMwl9fg5FXiiPfGlqqTzrV34gMm09aoEtW5AHiyVOqT0YrBRviPDV5JhwshJJDIebYEreJ2VfuN+qA9wTt4cgHasoWrvZwGxstEOuIpfKKsyYN1XGrdtfsRBUVHYdPOMnYTKHHNRuUMUSmUFA2W9IBApXJrFykG79Zbo+gZgBww5fXStaiSYnmT2xBg/yPbESjGKlFYBFx/Koeeyirb+57ZTUvd1mN0fvmeJHOfn2AQLUCH7/Yla+GSRCwk+ya2XFaLP/9csxBXpeANWYQwQJn5fhZv8H6bD+DQnb8SnaOWSQF+bvju6RP7Nc5vjOFkiw==</encrypted>]]>
    </text>
  </script>
</dir>