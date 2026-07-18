<?xml version="1.0" encoding="utf-8"?>

<dir table="vdmpbky1" code="ma_bt, ky, nam" order="ma_bt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="số chứng từ" e="Voucher Number"></title>
  <fields>
    <field name="tag" width="0" hidden="true" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ky" type="Decimal" isPrimaryKey="true" allowNulls="false" dataFormatString="#0" inactivate="true" disabled="true">
      <header v="Kỳ" e="Period"></header>
      <footer v="Kỳ/năm" e="Period/Year"/>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" isPrimaryKey="true" allowNulls="false" dataFormatString="###0" inactivate="true" disabled="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" dataFormatString="@upperCaseFormat" allowNulls="false" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bt" dataFormatString="@upperCaseFormat" isPrimaryKey="true" inactivate="true" allowNulls="false" disabled="true">
      <header v="Mã bút toán" e="Entry code"></header>
      <items style="AutoComplete" controller="PeriodicTransaction" reference="ten_bt" key="status = '1'" check="1=1" information="ma_bt$dmpbky.ten_bt"/>
    </field>
    <field name="ten_bt" readOnly="true" external="true" defaultValue="''" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"></items>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130, 0"/>
      <item value="111----1: [ky].Description, [ky], [nam], [stt_rec]"/>
      <item value="11001001: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l], [tag]"/>
      <item value="1100100: [ma_bt].Label, [ma_bt], [ten_bt]"/>
      <item value="1100: [so_ct].Label, [so_ct]"/>
    </view>
  </views>

  <commands>
    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7yO8c7aREiv1HuRaB+2i07tTuKM8zsy3gSCGpSp6uLzmqegr3zoUUgJNsTMCAIDQx6H7FmTa6/ZARs067lxYQTtutO7X0MwqGBUV20cslfP</encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzQMGZDNiLjxenZrYF8bobu3SIkFI64bLwVOdJxVzRSQZUjPnJW7c89JZqbOvGGMSvTFIqRTJdPWB+1COgueT7s=</encrypted>]]>
      </text>
    </command>
    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6c8nxJWU+dIWSSgWXhrmUEg5BfhaZkCp2o2OTBCZfbTeHcIaoJovmZF4VGCL+d4ucnWW3MlpzXJwQEujxtNDGPSw+Z48Lw2S5xPhpvwEU2nzWFahUcoufvYNwNgrl18mvqomDwn5C34pmLlnleA0dDQ=</encrypted>]]>
      </text>
    </command>
    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AhVVih3uJLbYCCYKm2KoxQLLb2f7soTit7X1n+aDmNgvvCpxHunUnQCPPc84UY/lU1vu1i3op4CNtI27WAM7HrJ/JLQ5sApldvWLkJNRzt3r8epQYqbJww56pyPZRlQ/lXaZiy+xzoTLK6lcnn5hXqEPFKMwF+f5booaejy5VjgeXeZCeO5Y+V/onfonxAU5IUgbexlVK1a1RGJqAqVSPa/mObBjmi84dc8U0O3kmed9u3OvN54unc18VTaDUvhJ77yG/XwauP1CZnSlB/kZC4ywoQr2qqJcgI98xjbvtsQ9P5hoT12FMRQLDiAOwrKxQb+3xxrV3QZAu+WPVitWzoDMmTS9GMZWnOqmzOfZgtv</encrypted>]]>
      </text>
    </command>
  </commands>
  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Dorvk85YJ1p/HR77/g7bZG16eD06809sfYgfFCsfJrcgnJD8np/IWFzg8/aiP9IDxIvEP6QDmeWVxNYFG1GJJlMNeBbggTcJ11tiAFV8wo97AR2wXcjKJ0tsl1KUz6tVS4AS2Uq5kgA6Xa5BwapqkA6bshbmR7i+8fbWcIpZuQm5IH3dsSGQ3ZssylNXxAOuHYOD13wWT0nWNGA5BRFDTd6QOiHuJ8tZAIb0mEiOydTAEBQPI9ppSHKIA7VT/F/+Ltqs/B39WFPo+tX2Wvho6CC1FV6fMtQPoq5ItvpMJAF9oln2cKf8d75otzpujaM5ErwYMtJiPPXwPnAuFlHmRg=</encrypted>]]>
    </text>
  </script>
</dir>