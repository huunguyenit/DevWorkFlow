<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="hrdmctca" code="ma_ca, ma_ca_ct" order="line_nbr" type="Detail" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="hrdmctca" prime="hrdmctca" field="" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="ma_ca" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_ca_ct" width="100" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Chi tiết ca" e="Detailed Shift"></header>
      <items style="Mask"/>
    </field>
    <field name="dien_giai" width="300" allowNulls="false">
      <header v="Diễn giải" e="Description"></header>
    </field>
    <field name="gio_tu" dataFormatString="HH:ss" width="100" align="right" allowNulls="false">
      <header v="Giờ vào" e="Time In"></header>
    </field>
    <field name="hs_tu" type="Boolean" clientDefault="Default" inactivate="true" width="60">
      <header v="Hôm sau" e="Next Day"></header>
    </field>
    <field name="gio_den" dataFormatString="HH:ss" width="100" align="right" allowNulls="false">
      <header v="Giờ ra" e="Time Out"></header>
    </field>
    <field name="hs_den" type="Boolean" clientDefault="Default" inactivate="true" width="60">
      <header v="Hôm sau" e="Next Day"></header>
    </field>
    <field name="so_phut_tt" type="Decimal" dataFormatString="#00.00" width="100">
      <header v="Số phút tối thiểu" e="Minimum Minutes"></header>
      <items style="Numeric"/>
    </field>

    <field name="tg_di_muon" type="Decimal" dataFormatString="#0.00" width="100">
      <header v="Số phút đi muộn" e="Late In"></header>
      <items style="Numeric"/>
    </field>
    <field name="tg_ve_som" type="Decimal" dataFormatString="#0.00" width="100">
      <header v="Số phút về sớm" e="Early Out"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_phut_bu_muon" type="Decimal" dataFormatString="#0.00" width="100">
      <header v="Số phút đi muộn cho phép" e="Late Grace Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_phut_bu_som" type="Decimal" dataFormatString="#0.00" width="100">
      <header v="Số phút về sớm cho phép" e="Early Grace Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="so_phut_them" type="Decimal" dataFormatString="#0.00" width="100">
      <header v="Số phút thêm" e="Added Minutes"></header>
      <items style="Numeric"/>
    </field>

    <field name="so_gio_td" type="Decimal" dataFormatString="#00.00" width="100">
      <header v="Số giờ tối đa" e="Maximum Hours"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_cong" width="100" aliasName="a" allowNulls="false">
      <header v="Công" e="Workday"></header>
      <items style="AutoComplete" controller="hrWorkday" reference="ten_cong%l" key="ma_cong in (select a.ma_cong from hrdmcong a join hrdmloaicong b on a.ma_loai = b.ma_loai where ('{[$tinh_chat]}' = '1' or b.tinh_chat = '{[$tinh_chat]}')) and status = '1'" check="ma_cong in (select a.ma_cong from hrdmcong a join hrdmloaicong b on a.ma_loai = b.ma_loai where ('{[$tinh_chat]}' = '1' or b.tinh_chat = '{[$tinh_chat]}'))" information="ma_cong$hrdmcong.ten_cong%l"/>
    </field>
    <field name="ten_cong%l" readOnly="true" external="true" defaultValue="''" width="0" hidden="true" aliasName="b">
      <header v="Tên công" e="Workday Name"></header>
    </field>
    <field name="stt_rec0" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_ca"/>
      <field name="ma_ca_ct"/>
      <field name="dien_giai"/>
      <field name="gio_tu"/>
      <field name="hs_tu"/>
      <field name="gio_den"/>
      <field name="hs_den"/>
      <field name="so_phut_tt"/>

      <field name="tg_di_muon"/>
      <field name="tg_ve_som"/>
      <field name="so_phut_bu_muon"/>
      <field name="so_phut_bu_som"/>
      <field name="so_phut_them"/>

      <field name="so_gio_td"/>

      <field name="ma_cong"/>
      <field name="ten_cong%l"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiF9PytaniaXIjIGKSeOFuMaq2R/dSsL2z91S42vHdFD5731+KYUH0A8/n8pmjAKi81CCtI/iNWKU4Zf2YQP1Guo=</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiPfDbQH+eNOEniFMwhrnDUHwutoQq7HkKXVcT7kygPW0Lcc0fz1a0Gkvc4aW9MWr2z+WCeK2batD416JE93rVN8=</encrypted>]]>
      </text>
    </command>


  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hlh6HCyoOBhYFDOqacC/XVK1xTJV8Rm/a/uwMfSXLj020VtrxM3Cic1nQKE9piE+rSdt9aNf9xUjIVePTzT24T/k706bzoYYfcjcGiug73678994sr0/1fXHEQb08MWaWzkA4Ec09YKTp+qnyTeiuJxugGaAP/ToO5btb27zizkTD0i3sbZrxezIojkrZ1MCVcRnuOPP51nX0+b1z1pntDmfynGee1oBPoZrkWfguRfsJQrEIMdx6k/VDhWT3dtwb/gyUmjhIpVPRg7JR8z8hGlYAYs315TMeYwHkpIdltt4+HvHfO616zn1uARHAu7TMZ69Euf0nW0zVg1JqTXT+rhnEzDteR9KelAwDpdUiYBYEwSTlpReSH9gqJDwRgBeB/7jMCNzGoCubB2T74x00G106rUfdr8knHLG+Xou6V9b9b4QVhXtjCDK19v2a16skmwNRo2pGwAoU3pweJYGcECzYY2LSZ8cbyDFpr9KE8r8A==</encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1OrDTQdK1c5LVXuryLCGmrZE6rTiEG3WmDYUe1Vl45Kef3gFU/KuTySrFxk1hnFo/5GxxA/e9FyaeEk5yi7XF1mo9mQ+Sq6F2B/yoznJ/nUdmmQvnW4o0ms61VkFuBnUG9of+y6zYncotnqzc4fXSON5PUv17YKFjASs7761CxQ</encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>