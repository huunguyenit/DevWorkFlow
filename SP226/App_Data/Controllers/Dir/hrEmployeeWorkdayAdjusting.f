<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">

  <!ENTITY ControlFocus "ngay">
  <!ENTITY LockedDateKey "ngay_ks >= @ngay">
  <!ENTITY CheckLockedBeforeEdit SYSTEM "..\Include\Command\HRMCheckLockedBeforeEdit.txt">
  <!ENTITY CheckLockedBeforeInsert SYSTEM "..\Include\Command\HRMCheckLockedBeforeInsert.txt">
  <!ENTITY CheckLockedBeforeUpdate SYSTEM "..\Include\Command\HRMCheckLockedBeforeUpdate.txt">
  <!ENTITY CheckLockedBeforeDelete SYSTEM "..\Include\Command\HRMCheckLockedBeforeDelete.txt">
]>

<dir table="hrdccong" code="stt_rec, ngay, ma_ca, ma_ca_ct, ma_cong, gio_tu" order="stt_rec, ngay, ma_ca, ma_ca_ct, ma_cong, gio_tu" xmlns="urn:schemas-fast-com:data-dir">
  <title v="điều chỉnh công làm việc cho nhân viên" e="Item"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="ma_ca" isPrimaryKey="true" allowNulls="false">
      <header v="Ca" e="Shift"></header>
      <items style="AutoComplete" controller="hrWorkingShift" reference="ten_ca%l" key="status = '1'" check="1 = 1" information="ma_ca$hrdmca.ten_ca%l"/>
    </field>
    <field name="ten_ca%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_ca_ct" isPrimaryKey="true" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Chi tiết ca" e="Detailed Shift"></header>
      <items style="Mask"/>
    </field>
    <field name="ma_cong" isPrimaryKey="true" allowNulls="false">
      <header v="Công" e="Workday"></header>
      <items style="AutoComplete" controller="hrWorkday" reference="ten_cong%l" key="status = '1'" check="1 = 1" information="ma_cong$hrdmcong.ten_cong%l"/>
    </field>
    <field name="ten_cong%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="gio_tu" isPrimaryKey="true" dataFormatString="HH:ss" width="100" align="right" allowNulls="false">
      <header v="Giờ vào" e="Time In"></header>
      <footer v="Giờ vào/ra" e="Time In/Out"></footer>
    </field>
    <field name="hs_tu" type="Boolean" clientDefault="Default" inactivate="true">
      <header v="Hôm sau" e="Next Day"></header>
    </field>
    <field name="gio_den" dataFormatString="HH:ss" width="100" align="right" allowNulls="false">
      <header v="Giờ ra" e="Time Out"></header>
    </field>
    <field name="hs_den" type="Boolean" clientDefault="Default" inactivate="true">
      <header v="Hôm sau" e="Next Day"></header>
    </field>
    <field name="so_gio" type="Decimal" dataFormatString="#0.00" clientDefault="0" allowNulls="false">
      <header v="Số giờ" e="Hours"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_bp" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99I+qBtTtKcMGUXHMVvGKiGcslfa9tWI9UOg8em9iVm+v7mzV5k+GlgciDZ9i+ritDyN4FAFtFOVI2XgDfaGzdGA=</Encrypted>]]></clientScript>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tg_di_muon" type="Decimal" dataFormatString="#0.00" clientDefault="0">
      <header v="Số phút đi muộn" e="Late In"></header>
      <items style="Numeric"/>
    </field>
    <field name="tg_ve_som" type="Decimal" dataFormatString="#0.00" clientDefault="0">
      <header v="Số phút về sớm" e="Early Out"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_tang_ca" hidden="true">
      <header v="Mã tăng ca" e="Overtime Shift" ></header>
    </field>
    <field name="ma_ly_do">
      <header v="Lý do tăng ca" e="Overtime Reason"></header>
      <items style="AutoComplete" controller="hrOvertimeReason" reference="ten_ly_do%l" key="status = '1'" check="1 = 1" information="ma_ly_do$hrdmldtca.ten_ly_do%l"/>
    </field>
    <field name="ten_ly_do%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 20, 80, 230, 0"/>
      <item value="1101001: [ma_nv].Label, [ma_nv], [ho_ten], [stt_rec]"/>
      <item value="1101000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110----: [ngay].Label, [ngay]"/>
      <item value="1101000: [ma_ca].Label, [ma_ca], [ten_ca%l]"/>
      <item value="110----: [ma_ca_ct].Label, [ma_ca_ct]"/>
      <item value="1101000: [ma_cong].Label, [ma_cong], [ten_cong%l]"/>
      <item value="110----: [gio_tu].Label, [gio_tu]"/>
      <item value="-110000: [hs_tu], [hs_tu].Label"/>
      <item value="110----: [gio_den].Label, [gio_den]"/>
      <item value="-110000: [hs_den], [hs_den].Label"/>
      <item value="110----: [so_gio].Label, [so_gio]"/>
      <item value="110----: [tg_di_muon].Label, [tg_di_muon]"/>
      <item value="110----: [tg_ve_som].Label, [tg_ve_som]"/>
      <item value="1101001: [ma_ly_do].Label, [ma_ly_do], [ten_ly_do%l], [ma_tang_ca]"/>
      <item value="1100000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        &CheckLockedBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHj+qpqrYi1uSk2p6sLvrQKjKTYFSVDUj3sTJ5ywuhCCJwunjv2Zmuzutm1d0lshFg9+VVPwsClUENusSfQS+gaKDlYZUQLFsnX0hyI+eEXN</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CheckLockedBeforeEdit;
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAnfmKSAJtKy5hx6O7sHsw5xSRE6C09ZcJqbMeLrzvKxEu47rAJFuVqhXk0JV+MxVorVM8s9Aobyap+7QNtA9vozz9t2feUPNlIATMWFPOS7</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5wYSL54cQwpc6EiB1XHUdKnKfGkdadgCzywju5Y87VGdCNpd4KFOwYQ3UljlWMVXlKFtOLx4LCbu2rM2T3SERfAKf8MLpn4h6Pf1aSmLg7xPQuXZpWsRZ2Yhr6juAgXEPJ8lKuVfg3TcbDGp+IMVvs3Fwxztkm+CcUxgDUGo2uNgDAcrd5KCJCfZIhWPV60ag==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIkHibOl3ERiVHBlw5eAxDeKZyQJHRr/+gq/RT31OTYGqD46b9RMKfrLBNyVHkaws6qh4mAVyEaZQcUST7VDaBw6ouDht/JazT3Ah3D2BPFDpMUFeZ1DuRlGvVoFzcSq805i4WoG1iWdFbFsF/GAvHvvBpaxbYvMlQtExDRZfhrwUvY9YvJf6BGOC4zY5EM8tXZmH5qE0i30CAoWiQLA2LRuo6bN2lCfLDBSyyZyIkjrK5zLdh5TW9iAODl862ZCGYeyywx1dxpHKIMmw3/mLBak5DS2QKeASNBfwN5jm9x/q4YCKWTl1hNYT8OS01FKNnobxgt036Z9y6L24Kq4ZIzEKLCRZS9ifUBFDtYrO1KQlKSGGtLox5csV1szSF6SI+pe10D7SCOhA9v0n6Iz//bgqb3/BLxeNoyObI5MnNhI8=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CheckLockedBeforeInsert;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwU79VyRyBChN7cVg/V7eyUlfAVzJp0fv3QC15bDRJWJHtVf2iXdeIyoqtInR11obViEXoM+S+29GyZ7zm497BERB3F/RnIqJfm2lzpUtxzuFgTxuqHzYSY/gGTs6GMeBZXkqXgh418tZhSO5nn4Y/B2fcBkTHAe2CEYURlQElc1fTnBHOSCIaXb0XjYYyfZzhxNkm4AhLtBHfwZuvOsFIDuZwiYvc7lmys69ZCl9c2ov4walcEfHPXEhz3mdK7ubMATlb4qD1QoHzWL88QLpHbWdv+ApI7Zho9SEuhwvNY0UGZqP09YqQULC66AvsFmjLWKs9Dvap5aboru9+2veT1+w==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CheckLockedBeforeUpdate;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLt1gZnr+6J8/wIj91pcYrEUNzn9W3pPoZXZmlThwCgy3cvLllIIPaFfUsmhmwPB4RBholZroPVbZKDK00WDRM3RCZOIXGFoWfLa+LYRRW2OWHUJ+UkNZ/wOR6KgJYjoK3UZRepOOAG4ycMy6Vs8yFy0L9hPM0X2LvVXdVPHfpRBQNqAMPOhrAWcnDpxFe61J18Ni/OaWOTZJfvAQlzKbFDSgpSeH/5coZVLsUv6LHCJK2RMjP+leVenwVb0xgFcJ+5W96HRpTq+WYtnNstaIRL+xWQYKRrsH5Fi+w58k3Lpnz4go7e2NSMwtmDLV/Vrcq5TE6YewrKOzu+TS1x38pQal2R1y1U9DFzIoVw7AKMJQ=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wjZRBRng0yPnV7d88oS7jqxFhefY+fiMIAJPyny1IyPaYUyNr9hGLrmVvgme8nZKx/1lYHe8QkjmTuDKs3EZJnec1YAm/POesKpZaGtsHXDn/OiB61GAJmEt/IuSCu9tGXuZDpCCvs4M1xpf3z6i2mWnkklkGtt2DG3mLeOL8NmHeL/ZWMeOMM1K38JYWU29gO8D5DQUQE4z5dbO1yBTLJd2qU2OMwJasHy68o+Kd9L/URu4UB1wfgXIOda5hfnMYOZyfzBwptAjUdxaVmkiON</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CheckLockedBeforeDelete;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EVCAjMvItAN8I78ufU2BuNypmGd0ZTLV+xcCufTiDuS8jHGhrjQS5EF5zB8buyn1TxkIEbT+g0AreTjAb8l6xThsrf4Nh4sKz/a0Q/jBCFTIFSuCC/xiUH3eCkY8zToDQEA0VQUYgNVKXwc6xiEtICwsbLMl+hWTE9ghGFfKy5bfjVwYNz5O4STPH9xhsf55x4XzjpUQ5McFopguCXBWTfLoNxKDYqU+lUA+x3kN68nheSvamOpET3Xhw2HBy++1Ba7hpm/C1ToI2KgLVmjikhncHbyjS/JO08k3PZjXUaL84s6u0NLB6B3pJQtB9RhCFYhmeHZRd1BiZsNCPhHwNgPikXOMUj1lZQO/cH4ptIczSvYEfRrx1Weq9BQYy8RFC43DAql6cGHYxnf6h5MzBMzHWZveDdZDnAWBN+JsjKVic5AP7VFryCLBBpVHjmuoj7C01mc430veSeMA6+hDR+o7+iyjLFZorCcXJK0V4iXm</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtcUTywWAtjp5kQe+T2zsL5c0peKh92Zc2J2xWs0K+koam5Uji3GmaIF+yyYR18GqsyJI8aKVON9Uj2fR5IHrrE+UfCtCBSbw/9xvoCIntz1kQ8coCv80OmuHuEMvkmZAxobPcbhL92R4VqYu/JOAxb4LfcQX+sg07VcSaKFRXqvy40tdOrgmXTUUfZXDaQatw+GqZe2DO5GaZWkltLB2XAU4nPy585gOg5Sv/6f3pQHYw2H1aqZIriKFr+MBley8kqM7arZIzKrLvVhx5fhzn0Ylcngsde0U3tFKCYssgV1fe//Lobs6rM8aQmPze9R+9E5XbncE/8hZ3SvQdmp/Ew2VIEVLauqQQpaQIxZ+msQ1ujSej+OFi8lS07ATnkFjWG8oiqoswsHYp10nm/Fpy+YYH8xH8ff7cDHk0mUc0/6c</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>

  <response>
    <action id="IDNumber">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5p1ONhnQ/dVeNDqmQY5tBTf9gniI5ZdZXG2dYHCvwCWNRE7oibOz15UAauBnUtmvG2plJ0n8VduM9zqgaRb4YlgHc2QW3PV5HfWGJB4RT7LQ==</Encrypted>]]>
      </text>
    </action>
  </response>
</dir>