<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">
]>

<grid table="ds2$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="3" id="SF2" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <partition table="cs2$000000" prime="ds2$" inquiry="is2$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="ma_cd" allowNulls="false" width="100" aliasName="a">
      <header v="Công đoạn" e="Operation"></header>
      <items style="AutoComplete" controller="SFCOperationList" reference="ten_cd%l" key="ma_lo_trinh = '{[$ma_lo_trinh]}' and status = '1'" check="ma_lo_trinh = '{[$ma_lo_trinh]}'" information="ma_cd$vsfcnlt.ten_cd%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99L084HB9inyPV93PkdgBZQojMMqyi8ID2aU83LBFjAojR94fdEICnAzwz+pD/bm0ncaWpPVjx+iaUa3YsznSMhk=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_cd%l" readOnly="true" external="true" defaultValue="''" inactivate="true" width="300" aliasName="d">
      <header v="Tên công đoạn" e="Operation Name"></header>
    </field>
    <field name="so_luong" allowNulls="false" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" width="80">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_bd" type="DateTime" dataFormatString="@datetimeFormat" width="100" align="left">
      <header v="Ngày bắt đầu" e="Start Date"></header>
    </field>
    <field name="gio_bd" dataFormatString="HH:ss" width="100" align="right">
      <header v="Giờ bắt đầu" e="Start Time"></header>
    </field>
    <field name="ngay_kt" type="DateTime" dataFormatString="@datetimeFormat" width="100" align="left">
      <header v="Ngày kết thúc" e="End Date"></header>
    </field>
    <field name="gio_kt" dataFormatString="HH:ss" width="100" align="right">
      <header v="Giờ kết thúc" e="End Time"></header>
    </field>
    <field name="ma_cm" width="80" clientDefault="Default" aliasName="a">
      <header v="Cụm máy" e="Machine Center"></header>
      <items style="AutoComplete" controller="SFCMachineCenter" reference="ten_cm%l" key="status = '1'" check="1=1" information="ma_cm$sfdmcummay.ten_cm%l" row="1"/>
    </field>
    <field name="ten_cm%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ma_ccv" width="80" clientDefault="Default" aliasName="a">
      <header v="Trung tâm công việc" e="Work Center"></header>
      <items style="AutoComplete" controller="CRWorkCenterList" reference="ten_ccv%l" key="status = '1'" check="1=1" information="ma_ccv$sfdmcumcv.ten_ccv%l" row="1"/>
    </field>
    <field name="ten_ccv%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''" inactivate="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>

    <field name="ghi_chu" width="300" aliasName="a">
      <header v="Diễn giải" e="Description"></header>
    </field>

    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" width="0" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" width="0" align="right" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_cd"/>
      <field name="ten_cd%l"/>
      <field name="so_luong"/>
      <field name="ngay_bd"/>
      <field name="gio_bd"/>
      <field name="ngay_kt"/>
      <field name="gio_kt"/>
      <field name="ma_cm"/>
      <field name="ten_cm%l"/>
      <field name="ma_ccv"/>
      <field name="ten_ccv%l"/>

      <field name="ghi_chu"/>

      <field name="stt_rec"/>
      <field name="stt_rec0"/>
      <field name="line_nbr"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcId2xB+L9A0FuJAQVgRyH0gM/L5jLwqjOegq/ugev0ANP+pl12wcpq/b05VIXZBplJ6RKGQ/i10U6VIkxiyGbBR3GPR7INa7qjHb+mg1o8kXwREaY9QG0tvKAv5M3D3dFw==</Encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKV8SQqddMG9kdcvUjxHMu6bzSZGQTwdbvEgcxi+kcNHAOfUZ8TrMm55Kj1UudTjBgvOk5g8486uyIoSDY9pUllB</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTElG1hN6LKG0Vp8Y9kWhG8aFFhpNj5+u9WMGtcb4/eEMLihrtTjxnXvNsRcJeT3kLDeym8xloFZHAXKgnrjfOmt7EsuHiwpyiyJb8b6q/hQpPjFSQ5nIm6++BVdukAL4MiJclY1cIngHql63rBvNRl9uendvdZUPXQ4dyRpOivwt8yVjjdBU5KIS63Vy9+Ynuis9uTlZJP1q5T6XmqgtZs7VjPtnL+E0AzGiwp3jNnRghwqz62flF4RIq3xIPDhBdgX/K0uYuc651qVj8hvPWz8FuGOq0NufxH1WgOvLvR5IPAc0bp2aSpnQfp2J85M9syPWf2b5FC8lpq1byCNRexdWmquyLQL2FR/wRLUeNokJmdgOsSz+1BIGzpsL2WU3fpG8jDyQ1igFiZuNMdLRa4WuldsDSCEIK9DwMxOY7lGfdSm2frFR+JukHxhpkyLa+f9ojicBu25fEhsKE7pK8QFzfY1Wjrp09cNx+lEPlvwV+SlBfU6W9gOyjYNvrqRri1MUklU+w6U+R55H83v1LFTPF2Ls8yCY7vqIjzBlZVWNGzp3Vb/XB9dBzQ53Huus6rNFl2UrBV3OMkPsDIErYxj91omFD3B2aJNXMtwwrbx0JpyZLnqA/6NB2rD3qm1QWg/8bARLobjHPVkFGJb8RvKImXhcDSYGz3tmSvR7Gp+z8XswVctqmVBv0ZR0GIOElGG4H7XPvktkoOjD8gSF2Zvk54haQIk93os1BFhyq39dKiPeBioW8Ob2e1hY3bAcTARv/RbPkvWvbclqN3tmPBDIlZkqFRMRLQ1NU1Tglegg7/zEKv131Uagko+Yj0ZYcUA/eX25j5OS7e4KFmhOnwctgbdHSeXvNd28PBZVSXhXwUpBWlok2cZYzxEm952dr8OhLkv52W9mH/RQmLM7emQmMIWx71jX1tqFPvudMj33YwNOn3AFb/x4HpqyMeUDPDVpoLb8ouzJoM9wuXzo9eZ/0e5UBiJ09UcFV5uoYcY2XKFooHUG3P0bfmpNMamL2jAKo098bdYyR4gSyH8VdV6k2LEp8AFySChnvaWZR0D5dWIwiKfkbDGJc0KKNWGHMhi9aZf0wr8wcdIPSIYmitWIWLj23VnmT6QkM5proRZVaawoAmxrRxo/6Dd3VBkSs6u5KhDFrCTZIi+j02iyeQ6GJ9ZAKNq0uPe/kdKBOY3rALxsmUTI0wpWJhYVDxXuK5NXZHIIKT2alC8n6sQTakMiqer0ISw0Go3SIaM8X4lpK9X/XFXrAOVXXj7iftQgNLVrK0dlF1BIaPf0vmEzgc=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Retrieve">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4abGtPaHRrFHld17nYO+0NmwpNtFIEvSaAOfGoBEMnePzlG7SfvjQ2yPjmd9qafpQVNOM07x2U/KfvV0TON2jyjP7jwkqOnIsEc5MO2Y+AkebIv6JfYmpneSpqVduYKpfJlLer/Bf8/gHD64FNY4qewteNG1Kw76CROgUn9NumnCRuKkcYHDXYUqfIGI/19wewZzFCERM+K+C6GDZyFFnN</Encrypted>]]>
      </text>
    </action>

    <action id="Operation">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm79vDV7ZVomKubLOj6Ewe3wBBO67FT+HcVW+K0JRqB1EAiKXbsDth8ULClYz2oaoJ+zgkoNaqwCKxn1SekfMTaoe2l5BP7N43EaudpbQU/oiX+uQwQwjViIPFxtM6SpZVbbZsVRh+bG/50/pzV/OBDPwX/HrzYMQUXky5p0ZVLbvZlVB1wQC1Xo9dzI4fMTuQI=</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK+w0/7TuML2kYZ1eE3mLRhdCaEvPJxREL+UILLtzYqR4SXSseiC52P4FN8CvYPGsBisGOBPF+1wq9FkeYpHtouagAC8jvwPLCGjPNZKt0FKGj2FSSkwLaxjYdE0mNJRYCmmoRO1mZ4rnvVWonW7kcbPtfoY+4k900x2XGGDJLwyrG0vTPpyQlRKyumGJvAEbfwDj/+v6pE0jyGvahExgN16lGzqfRV2shKJfPM4wSFhDw==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <toolbar>
    <button command="Insert">
      <title v="Toolbar.Insert" e="Toolbar.Insert"></title>
    </button>
    <button command="Grow">
      <title v="Toolbar.Grow" e="Toolbar.Grow"></title>
    </button>
    <button command="Down">
      <title v="Toolbar.Down" e="Toolbar.Down"></title>
    </button>
    <button command="Clone">
      <title v="Toolbar.Clone" e="Toolbar.Clone"></title>
    </button>
    <button command="Remove">
      <title v="Toolbar.Remove" e="Toolbar.Remove"></title>
    </button>
    <button command="Retrieve">
      <title v="Lấy số liệu từ quy trình sản xuất$$90" e="Extract Data from Routing Maintenance$$120"></title>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>