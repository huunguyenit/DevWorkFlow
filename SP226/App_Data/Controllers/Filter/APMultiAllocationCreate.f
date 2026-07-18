<?xml version="1.0" encoding="utf-8"?>

<dir id="PC0" xmlns="urn:schemas-fast-com:data-dir">
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
      <items style="AutoComplete" controller="VoucherBook" reference="ten_quyen%l" key="status = '1' and ((ma_dvcs = '') or (ma_dvcs = @@unit)) and ((convert(smalldatetime, '{$%c[ngay_lct]}', 103) &gt;= ngay_hl_tu or ngay_hl_tu is null) and (convert(smalldatetime, '{$%c[ngay_lct]}', 103) &lt;= ngay_hl_den or ngay_hl_den is null)) and ma_nk in (select ma_nk from v20dmctnk where ma_ct = 'PC0' and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') &gt; 0))" check="((ma_dvcs = '') or (ma_dvcs = @@unit)) and ((convert(smalldatetime, '{$%c[ngay_lct]}', 103) &gt;= ngay_hl_tu or ngay_hl_tu is null) and (convert(smalldatetime, '{$%c[ngay_lct]}', 103) &lt;= ngay_hl_den or ngay_hl_den is null)) and ma_nk in (select ma_nk from v20dmctnk where ma_ct = 'PC0' and (lstuser = '' or charindex(rtrim(@@userName) + ',', replace(lstuser, ' ', '') + ',') &gt; 0))" information="ma_nk$v20dmnk.ten_nk%l"/>
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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XHr/yZgO9BS8mxonQy//dVgS7fmWrOpz/ITJjMsw7hBuF1hk8xblVVrIi1qCfvMb54nu8ZMlAqBSWyuJ2BAKkuXIDw/x51f90VRq/hHPT7JBjm+Fof7Hfx2jdgZB7ZnRV0vYQ8CNTxGdo15wE7ZmSKu9KCpTBsWiFvKqr8c+nzOZ6qnDasj7tWinMMd4h7B0Wgt6q/7biYHNEGh7w71evDGUDmJKc2bo0/oWEmT3r967S/XJKc92LLb22Y6AXN7AqxtowNMPAo52es7TNZdV5bJwOTRd520HasRj72Pi/XTycmZxVvH1SsynhT6w38XIcSXM/+DIrFoZd7fNcYhY2E1gZLShJAuJuF+XVzqHEtCihxzJLtvhfMUUeVTZZqs4HsbednYwP0+tIM8vWDLRQpmVwIRGeQIx9PYiKhg7wR5atZkXVvIIkZRSt2qFSWyA4nIpqw8qoakiq6IYofRedqoA5FWW/iObmfK88UN20j6zTql7XnCuE32Q4ZDJxzPdLemRnkUp0Z2tsW2bCt8jIVYe5cqI0GR9pVIcNuQ+TIBtnRlSoLmmtEno0Nj2LeXcjBB7jgdD8w4WIeuEg/omuh7SmZmoAqwKNvHZTq9+QLcP0sjAqnceW6UCHiM1GUhf3Pt2A/4ed9954GI3TkhNNY2a8ievUDQaHqc8C394s+7dKa8rOQfrhpXkNfVl7sVzhy/ibpO2YaJxjLOkkbYO3uyOQbbeTJtf3nVWuynMf+3FkBHEimn+KjPvgAw8HtwupKl2M9UoGCxuKwxZwlUm4in9v3Qoc14apfWRiFqpDucdIinFrtwd4lPRgoUbJnLjqmFlIIW9ebeRR9aQipim9kIKQRaUWx0PtM55LZY4MeetQ1Tot/Dpi+5KWWloSLTXe1hIRwrNBm7FrtdkMOcZeVMlLr5HfePisGTK6FnEB0kKBURcX6wJ13Scl6Z2K8JX9N4cLjJ86R8SIlm56XsDqM0TRoZHKDbQugoHcdthEnePmBiSMkJ6dc3FCPdT4zOnKvpK+TSR23Q1f0eFknhs6ePXBwZxPs5421GnSpeOk7zfCrdfTSfljDjEY4Te1tpLg==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkZ4UwdHzCv4M+jzUjSIKWJG5tBV+rFhfaAyk4RMpjapHviQ8cwdR9EgUoigDlZb/QGJAe+jS5iFBdxJpbojf6iovlf/5MJYpKFtREjPdZ43OVMwl9fg5FXiiPfGlqqTzrV34gMm09aoEtW5AHiyVOqT0YrBRviPDV5JhwshJJDIebYEreJ2VfuN+qA9wTt4cgHasoWrvZwGxstEOuIpfKKsyYN1XGrdtfsRBUVHYdPOMnYTKHHNRuUMUSmUFA2W9IBApXJrFykG79Zbo+gZgBww5fXStaiSYnmT2xBg/yPbESjGKlFYBFx/Koeeyirb+57ZTUvd1mN0fvmeJHOfn2AQLUCH7/Yla+GSRCwk+ya2XFaLP/9csxBXpeANWYQwQJn5fhZv8H6bD+DQnb8SnaOWSQF+bvju6RP7Nc5vjOFkiw==</encrypted>]]>
    </text>
  </script>
</dir>