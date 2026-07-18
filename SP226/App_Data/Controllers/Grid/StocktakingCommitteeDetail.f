<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="kkycbkk" code="stt_rec" order="stt_rec, line_nbr" type="Detail" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ho_ten" width="150" allowNulls="false">
      <header v="Họ và tên" e="Full Name"></header>
    </field>
    <field name="chuc_vu" width="150" allowNulls="false">
      <header v="Chức vụ" e="Position"></header>
    </field>
    <field name="dai_dien" width="150">
      <header v="Đại diện" e="Delegate "></header>
    </field>
    <field name="nhiem_vu" width="150" allowNulls="false">
      <header v="Nhiệm vụ" e="Mission "></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="ho_ten"/>
      <field name="chuc_vu"/>
      <field name="dai_dien"/>
      <field name="nhiem_vu"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiIrunk537LtbtduwQJIgVb4uNlsJDKVCYBgXBf3QtPT6S0WzhXgo+SmTau2UzaNiyNhc2v/4CXN5xMq72oZ0LRf4Bmq8O9l5hgJouuVdjpuL</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiHvAQkqBPwC5EfviPcaVBVV5pmslp+WqvZB6OLksRDq7vn5kUxwhZWe1HI/bPuPYjn+A20ZkMP3vhh/MlPXGAxA0W07XvwRSIuQ0aGIMzF+N</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hnh6Bs4S0y9mUW0fPBblozeqZ3yjj6WiVKoK7F9YDfBYBfkanCI4r9BAbp4qzut4Hv9D53mn7uF20BxABoKRGHXE0LtBqLSFg/k9izTu1Nt9SzhD+uBiqc1JFfPMGNhPnQUdSLejMQBgjyuv4hs3EVBZCHUBip4KZUL8ljIsdFYKhXDYOGws6aGHBjHRr7AVtBtybg6J0tPnifKhtcrngtUdEV3uy7pef4oggNNy9n0U6WTA+Wm939SBoI/ZZ7O7MhDIXEoZOz5yykFMBY+RlE8q0ljzdOOv6i+ONIPqaiKhNfoOlVgF3pKlZFoE5HQEcFUYhiweUfq/4lgW1/bV+1b8Fe0xshErZ2xPZbmepSb8A==</encrypted>]]>
    </text>
  </script>

  &XMLStandardDetailToolbar;
</grid>