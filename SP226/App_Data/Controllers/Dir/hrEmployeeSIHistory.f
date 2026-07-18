<?xml version="1.0" encoding="utf-8"?>

<dir table="hreqtlbhht" code="stt_rec, stt_rec0" order="stt_rec0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="quá trình tham gia BHXH" e="Employee SI History"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="line_nbr" type="Int32" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>

    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99I+qBtTtKcMGUXHMVvGKiGez9zmZDjF3M0BLnQSab2cC+w0P1RYL0poqUYV7UQYFwoGOf0ffZIiuYAx0Cmn9nLc=</Encrypted>]]></clientScript>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_thay_doi" type="DateTime" dataFormatString="@datetimeFormat" align="left" aliasName="fromDate" defaultValue="newDate()" allowNulls="false">
      <header v="Ngày hiệu lực từ" e="Effective Date from"></header>
      <footer v="Ngày hiệu lực từ/đến" e="Effective Date from/to"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99ObYTKiU8ESSMtpvwAQEiAp3xMlQim66sA/RsY9LxxV60gNPjh0W7fBPOcKe0zxoPpgpWrju/XqSUXaxugUOCmnw3ctioRfPC39d/mSOPt8j</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_thay_doi2" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày hiệu lực đến" e="Effective Date to"></header>
    </field>
    <field name="loai_thay_doi" allowNulls="false">
      <header v="Loại thay đổi" e="SI Change Type"></header>
      <items style="AutoComplete" controller ="hrSIChangeType" key="status = 1" check="1 = 1" reference="ten_loai%l" information="ma_loai$hrdmltdbh.ten_loai%l" new="Default"></items>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="cap_bac" categoryIndex="1">
      <header v="Cấp bậc" e="Level"></header>
    </field>
    <field name="chuc_danh" categoryIndex="1">
      <header v="Chức danh nghề" e="Job Title"></header>
    </field>
    <field name="don_vi" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
    </field>
    <field name="dia_chi" categoryIndex="1">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="hs_luong" type="Decimal" dataFormatString="##0.00" categoryIndex="1">
      <header v="Hệ số lương" e="Salary Coefficient"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99ObYTKiU8ESSMtpvwAQEiAp3xMlQim66sA/RsY9LxxV6wpGShIWb9TF0BRG4Gsn/Mmg2iscbpWPA9UvWwMi7+m7jYQCNXfudvoVW21q8hRAy</Encrypted>]]></clientScript>
    </field>
    <field name="hs_pc_chuc_vu" type="Decimal" dataFormatString="##0.00" categoryIndex="1">
      <header v="Hệ số pc chức vụ" e="Position Coeff."></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99ObYTKiU8ESSMtpvwAQEiAp3xMlQim66sA/RsY9LxxV6wpGShIWb9TF0BRG4Gsn/Mmg2iscbpWPA9UvWwMi7+m7jYQCNXfudvoVW21q8hRAy</Encrypted>]]></clientScript>
    </field>
    <field name="hs_pc_vuot_khung" type="Decimal" dataFormatString="##0.00" categoryIndex="1">
      <header v="Hs pc vượt khung (%)" e="Off-scale Coeff. (%)"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99ObYTKiU8ESSMtpvwAQEiAp3xMlQim66sA/RsY9LxxV6wpGShIWb9TF0BRG4Gsn/Mmg2iscbpWPA9UvWwMi7+m7jYQCNXfudvoVW21q8hRAy</Encrypted>]]></clientScript>
    </field>
    <field name="hs_pc_tham_nien" type="Decimal" dataFormatString="##0.00" categoryIndex="1">
      <header v="Hệ số pc thâm niên (%)" e="Seniority Coeff. (%)"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99ObYTKiU8ESSMtpvwAQEiAp3xMlQim66sA/RsY9LxxV6wpGShIWb9TF0BRG4Gsn/MhhQEX0r/LopgZ3Hr5K9OgZPvh3jiy9/QEbNYHua6pNb</Encrypted>]]></clientScript>
    </field>
    <field name="hs_pc_khu_vuc" type="Decimal" dataFormatString="##0.00" categoryIndex="1">
      <header v="Hệ số pc khu vực" e="Region Coeff."></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99ObYTKiU8ESSMtpvwAQEiAp3xMlQim66sA/RsY9LxxV6wpGShIWb9TF0BRG4Gsn/Mmg2iscbpWPA9UvWwMi7+m7jYQCNXfudvoVW21q8hRAy</Encrypted>]]></clientScript>
    </field>
    <field name="t_he_so" type="Decimal" dataFormatString="##0.00" categoryIndex="1">
      <header v="Tổng hệ số" e="Total Coefficient"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99ObYTKiU8ESSMtpvwAQEiAp3xMlQim66sA/RsY9LxxV6eh0iINYwDUPxgZiJiwPZp4q63kjzP6urQKuEzhUHafZYtxlzCAqmEi7YYIlsLmyl</Encrypted>]]></clientScript>
    </field>
    <field name="luong_toi_thieu" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Lương tối thiểu" e="Minimum Salary"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99ObYTKiU8ESSMtpvwAQEiAp3xMlQim66sA/RsY9LxxV6eh0iINYwDUPxgZiJiwPZp+wM5IHWz+UZ6ltXLH3esSN7v8kZJaygfdTrrfa2j2vw</Encrypted>]]></clientScript>
    </field>
    <field name="luong_co_ban" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Lương cơ bản" e="Basic Salary"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99ObYTKiU8ESSMtpvwAQEiAp3xMlQim66sA/RsY9LxxV6Yd5M++okhrzx4EGiHCa6wjmtNFHRdDTcz36KSg8f3ZKFCsBr432EZ0ck1yTF89IK</Encrypted>]]></clientScript>
    </field>
    <field name="ty_le_bhxh" type="Decimal" dataFormatString="##0.00" categoryIndex="2">
      <header v="Tỷ lệ đóng BHXH (%)" e="SI Contri. Rate (%)"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99ObYTKiU8ESSMtpvwAQEiAp3xMlQim66sA/RsY9LxxV6cf57EclTSP19VxaKKTGcc/si57Vahl2wL8nTVeAf8i4fAI8wVdbD3Aq+q/7aYysE</Encrypted>]]></clientScript>
    </field>
    <field name="tien_bhxh" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="2">
      <header v="Tiền BHXH" e="SI Premium"></header>
      <items style="Numeric"/>
    </field>
    <field name="ty_le_bhyt" type="Decimal" dataFormatString="##0.00" categoryIndex="2">
      <header v="Tỷ lệ đóng BHYT (%)" e="HI Contri. Rate (%)"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99ObYTKiU8ESSMtpvwAQEiAp3xMlQim66sA/RsY9LxxV6cf57EclTSP19VxaKKTGcc1R0bAUg90s/85Z1wv5mZdMTr4n2PQGpH8ISUWa5Ci1m</Encrypted>]]></clientScript>
    </field>
    <field name="tien_bhyt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="2">
      <header v="Tiền BHYT" e="HI Premium"></header>
      <items style="Numeric"/>
    </field>
    <field name="ty_le_bhtn" type="Decimal" dataFormatString="##0.00" categoryIndex="2">
      <header v="Tỷ lệ đóng BHTN (%)" e="UI Contri. Rate (%)"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99ObYTKiU8ESSMtpvwAQEiAp3xMlQim66sA/RsY9LxxV6cf57EclTSP19VxaKKTGcc7C+01iHc4JdNIfs0FDUm08T3uBjWGpS3cCC9tUxal/V</Encrypted>]]></clientScript>
    </field>
    <field name="tien_bhtn" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="2">
      <header v="Tiền BHTN" e="UI Premium"></header>
      <items style="Numeric"/>
    </field>
    <field name="ty_le_kpcd" type="Decimal" dataFormatString="##0.00" categoryIndex="2" hidden="true">
      <header v="Tỷ lệ đóng KPCĐ (%)" e="Union Due Rate (%)"></header>
      <items style="Numeric"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99ObYTKiU8ESSMtpvwAQEiAp3xMlQim66sA/RsY9LxxV6cf57EclTSP19VxaKKTGcc9jDts6coHeLJy5zVb8NuZZGXA0j1rpyN1R0xzEOidGc</Encrypted>]]></clientScript>
    </field>
    <field name="tien_kpcd" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="2" hidden="true">
      <header v="Tiền KPCĐ" e="Union Dues"></header>
      <items style="Numeric"/>
    </field>
    <field name="can_cu" categoryIndex="2">
      <header v="Căn cứ đóng" e="Payment Basis"></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="256" anchor="8">
      <item value="120, 30, 70, 100, 100, 30, 100, 0, 0"/>
      <item value="11010000: [ma_nv].Label, [ma_nv], [ho_ten]"/>
      <item value="1101----1: [ngay_thay_doi].Description, [ngay_thay_doi], [ngay_thay_doi2], [stt_rec]"/>
      <item value="110100001: [loai_thay_doi].Label, [loai_thay_doi], [ten_loai%l], [stt_rec0]"/>
      <item value="110000001: [cap_bac].Label, [cap_bac], [line_nbr]"/>
      <item value="11000000-: [chuc_danh].Label, [chuc_danh]"/>
      <item value="11000000-: [don_vi].Label, [don_vi]"/>
      <item value="11000000-: [dia_chi].Label, [dia_chi]"/>
      <item value="110------: [hs_luong].Label, [hs_luong]"/>
      <item value="110-101--: [hs_pc_chuc_vu].Label, [hs_pc_chuc_vu], [hs_pc_vuot_khung].Label, [hs_pc_vuot_khung]"/>
      <item value="110-101--: [hs_pc_khu_vuc].Label, [hs_pc_khu_vuc], [hs_pc_tham_nien].Label, [hs_pc_tham_nien]"/>
      <item value="110------: [t_he_so].Label, [t_he_so]"/>
      <item value="110------: [luong_toi_thieu].Label, [luong_toi_thieu]"/>
      <item value="110------: [luong_co_ban].Label, [luong_co_ban]"/>
      <item value="110-101--: [ty_le_bhxh].Label, [ty_le_bhxh], [tien_bhxh].Label, [tien_bhxh]"/>
      <item value="110-101--: [ty_le_bhyt].Label, [ty_le_bhyt], [tien_bhyt].Label, [tien_bhyt]"/>
      <item value="110-10111: [ty_le_bhtn].Label, [ty_le_bhtn], [tien_bhtn].Label, [tien_bhtn], [ty_le_kpcd], [tien_kpcd]"/>
      <item value="11000000-: [can_cu].Label, [can_cu]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 30, 100, 0, 0" anchor="8">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 30, 70, 100, 100, 30, 100, 0, 0" anchor="8">
          <header v="Thông tin bảo hiểm" e="Insurance Infomation"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9Ge+QSms2Uij978RkGV9Tnv0JAqAE6rYexK9WbYQaZGgf2voxhs3EV5CGSYXx8wRCAnek+dGzrnElNH3pTNyzFSE0wBCDS4bHRUO5nm9Lx0SQLpEgoCk2Z3i0QhWBUdcEhI8niii/UI1LCIfd3GnJooZqH/XKLchQtdFMEkqElXq55qIAWSKvJGaEZZrNfXJL0PcRQnOe+vuPpNiT0DdyXd5Yf3kNpw7h7vFqt/TlG098ZkYxj3k0WRvAFYWsWqoTj/WeMtA5hviUbso9zf9E0U4oAgfEClhQE7cdw1uoG6lt4tBmXgM6fJJt8gWI48Q1tEHHpwwbHtlL6T+wRfg+z+NoVwbIrkaWPIiOlqaZOHE4siDoFAr0IOJ5sLCnYN6Q==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLawxGCuLySN0uwaFGfgsHg8po6I9kd638vek7n2o05ywX+ZWMIkCOoGmE+3pS9mJpogRkK7g8lLD6j3LEoYxNZ2BVANpfzVaB3dP6fgjGiH</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAnfmKSAJtKy5hx6O7sHsw5YaZ8NUjcHB2p1mkcUiqc4AHLHy21H95/owMD6Pcb0umeze1srD0FAek3axRLA91OM07TuY8X1tSORd+bxhCp6</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2GXVEW4+Qr3bPaP2H2ciTj77TVegm5mUz62UvScek8mbeL7y7s+/DrPZW7aF6QKY4dNCZR56HPjpJH8yPQckICWcFSnlMiL+Yq9iAlxwhh1MgBh/0RALQGwibKEpqYfofoQSfxHGTsVDIWxrct3Xy4uA5NTxL+dX3SE6ZTn8LIJmrX0QSxh8E0AwJsP6XIhiW/r4xljeWzaf4+ixgm7uRwFgohI3B+pz4AHWxQmXyhZQ==</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5wYSL54cQwpc6EiB1XHUdKnKfGkdadgCzywju5Y87VGdCNpd4KFOwYQ3UljlWMVXlKFtOLx4LCbu2rM2T3SERfAKf8MLpn4h6Pf1aSmLg7xPQuXZpWsRZ2Yhr6juAgXEPJ8lKuVfg3TcbDGp+IMVvs3Fwxztkm+CcUxgDUGo2uNgDAcrd5KCJCfZIhWPV60ag==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7C0jxTP8IRVKR6Q8exYwzyhigz9CnF/J/znI3cNpo4H1H5e18mIxrnCqrnAYVNDn22h/B9RqBfwuV5zhLkfsQ0aAMc4osDZdKomzOBy/pR12VHuca2dwdpHL7dU1JFpC7+MjeGmDxlN5TIzPzbYW0+6OWfs20Pqdpv7oCqXD0NhmOYGbEqZEY/nPOFNLllfnXoz1CblMvXlLZHyPKa03A/qk10Bcai9AdIMhwd4wpnxU0d9AxSGZPLiJ0qCSXEllDO80MzcR+7sG5iC+FVA9H+1mSrV8nBGRTgjitV+BN/CtBd5FZKojLCxtMF42NijRdjX6T1rzlLScs0l+o5TXlC4Zb5zaL+a4woHplLpKBWUB2JFGW4J336VMEuMiP5Pgtu</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcD9d8iXolkoFL7ZqjVF4CnKLbH1W5VecwY3BZXHe4ZkQvbrEgnVYhVFVmiVyHsCYWg==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu66t41KSlDlUGRGFS2Af2LbUbZbOb8b/njBDxj6cm+HIgpFvszL8KiTwKMj7PwRDe443klLpnFCvW/rBomi/uKgJbzxZGERkayAtePGA6yqWuan6tR5q7uvESMw8stx4XzMvwfCwA/4Ym9GX1FZb1o+HvRL668wIevm/L2IDEC3zl9B5tCkJczhIlmQ5uQQdvwishEitXlzat0fN/q4s/aILFaGgGU1MH5FcMtUVqFyW9vu4cRKGHvUN2RZ66W+GiQfRbemgPCiNhV9QTjxh59Pc57F2MLhADLcjOGUXUz+5SJR5Xszcf/3FxRd7wTZvQF62COOc9o3Pq7eD/JBa6b5Y0nQhzRYyjGlOBoXj9KMXa+1FgsvjvsR+KvCqwiCAy2wrPCx73/Gf/G30Atqx+B/aXAakGSP2cIye8/6N8ryd9nnyKJ/7HCLqgZjuvvYhF7KaahlsILvAbxhjAQmZHV9wNxQgHTuImHfrq7IJXeENypf2z2vXAWXwD4ynWTSigGlp8eCjrggDIkji2nyAyCDg1u/oGFs2FoJlQ1s0bf7uJw0yuJqXbgea/QhR6yWPsQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV1kKnbVoNF2njbwUgFKK4xsHhNBWsf1R4/4O0EOnjfuUmKMZoP4i7Q/+e7puoMkOzlpqsY1Tu8ofCt7pkLc2Ij0yCUs8yowNnEOFXuUdZEOjZos5zZ7Wn79Uof1Y61K3B5PFJbgj3kLJYkN0VjbKTPG8ADsypv5nTDWLw2lqJtLk</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkCWC1lbyXQU/cRhvaeUBzByiIyGcD5TLth/VmOj9a5BDOqFQx9OheLinrYRJPSjR6YTWKu1410HUNhGLLfsiW0ISRrRaKo0Y+mM65PjvHuQWfsuxg4lUgGoYS4oYxqxDdo5tEw2lwLNDlYKBCvTPJiwE7iNQOFQTnrW0lp54hd3MKUNOFR9KyxujwxUyuXFagGWO27N43X8EJZ+4eZEHhOjrn2cGOUn+VaxLSXTRMCsBC7p2ko0+D6d+gJHd6nkVXk/WxzV4RSUCfmQaLE676Qr7Z5M9l9s4WU9h7o+82//mdnQN+zFpJWCixyZHQ9ktXBf7UUns5tCsJf5uwq+mOdj</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0zU8wFbBLdZztRuEJ6O52mvbutsP+wAYmeQsn/6608j54EN0pa7GRCrNMUwatx5vgntWbeXKdIeGuraMESbSDgUOikaugHaPqUGjxr8vZPtOFw5KTepf07LNnB4D0A9wn1gC7/nRGTbSJl8zpxrQ9gJN7icKE64mwrWTZEtS0oKNqzED4MsteR5+8Zf7KNXFxRnb8jE6dJFH+LFov4FmgNugrVuXceAhEUEoavf9eLrj49dYtCuij6diFwhKwVpabzSTjTW/3xq+TRfAaGSd67fOjfg4gjbsDrqMk5y4kzUfz9TRmqTVF+VVOfGAdZ6Cip4TVISxU5nDIZCrKMpJ5y25RMbOMzIRogh+yVz7+KGz1QUaS/bA5g93o20fd3ntJe/RmwhjTxoWDbve+5e5tY+A8IS5RkTnilgT5Nq2H5CTSq2aho3v/zKDeSW1q+KLin5Z45pms1swH//PYvMkr5zZojNDllNR3oQyVtSjN/kHQ9vd1TTHpu7eH9qDvRoThBnEmD3Pi6nqNu4ZDQVE7RJJZ22IcqFj+mmezo+LjQ2umBKl/8xmRoN6H2UTgpHA0F3Zdr/gHqZoLY9YbMlFz+5uXX4c8MTfqYetpTm7wlxuaCOiZiiftALk+EHTDTQEPTZezTOhhvzbhqjU82O8hgEG5DkCgSKXyFcwipCaOR8S+lhuC8ZmT2WufZUf04uRmyehLxCGS51hzu1zsA6pKCraf0B/4O1QdzXu9DwirbLm5T4mkWDuarAx4XyzsfToCJJYFUTiUb2hQ6V6jVXHLzhVfKdvNSrTGZmfiraoLGY0JqYSVft5NguwpIhEIvZPbcdoLfvNvu5BBC/Sn7zu2VSwAc2l16ixiXiZQT/8904Lg25zuVU8WxI1XYmiphshRDkFqhJbiDG2wDfm51NBPLCLl6x0BfvUnxrrsGWnu8Zu9hN+e1lNFUM7kFUBbWyzQIdLmTOtOjdp4MrO1Oi3pV8lmIzadSrfWGgWU6luOxrSBpQ86uRjA3RRojgBnzWw9clXQu4S3dejP1EiYp6mskT8TNAle8gfxO1j9rhQmvQvMTtOkxGDQT/vpHplqWTIuaETNMvLxL2uQ/JpuHMVVfAg2RUMFgqevXShLD/efANzzR/l6P8r/JPWaUhSTur0XWEpUD5gcwyd+PD/4D3GtBpUWJkaZXCIvPj5kd06XPg65JGYrsxGos6EGZpBTQHm1EB0Cb9u2kw6nDcH0K7/IYpN3Z/mygkEnxhlAC1cBKW8c/huR3LVa5rZ2ZZruEDCZPW/paZatL3K2oa4QlhmoJdwEG6x7HRxAZPWBhW/FPydxfRxR3RDvai66oOqQz2GPIgAwfiPC1ls5RUBwPOLU=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="IDNumber">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5p1ONhnQ/dVeNDqmQY5tBTf9gniI5ZdZXG2dYHCvwCWCAdg83sEsrMv6017DYvG1tFDueU13qmFjdRGekxe4xl1nnl7YRfz7k6HNVLD8W3Js7RBi37B3Nvjy7N4N5S8+fLRE8ovLxZK+VQpMKYuGrkuDxEYF75SJYk6EX4Zuqe9PoqJ31l4M90SnPdQpEFP0aWVm+iIKYT4dUYOJb6e63GESbg8piPcgL1zcfv7yLeRSR88EKQrGq27LuxUIxPQxrwc5cCiMqTztxC2a2VNb5nLWKQkuW8EHD2SW12VnHivQ0jssFDxpJdIzK2m4MWj+pAMDHX5Vb0MgMVETqpLFZ7XImRWwSRZAIN8XYH+NDCxaHfW+KyYhY7hdbGS8rle3kTOEbu3RNJSfLNYe0iTeDIlYxfsHCiR3+/fXZ+ozK9dcYiC6VVOIPxPbHVBj9gUVS42ytiPZgLXjck7Zepgxok5cs94Wmgyb+RFDVapWaDEbNrIhO5a1w/YG1AqcxDNkGLmBXbSdcOtmTpc7XOeRgAV7ovXbcq4v05cCCfC19hSLdYFOzNt9P7CgUHpNS1FbXynW0W/CqDLxGIuoDgOQb4CMYC5dsG7wmedsELPU8Pfg==</Encrypted>]]>
      </text>
    </action>

    <action id="MinimumSalary">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuxM3an7UwaoRzIrfPOJHEbwz37izyUQwjB549eJ9gPMvquYQ0fn0Q0zhUdWX4VvjTsWH05cKL+H5UF8o3zwXyugnBGlpbNHDNJlO0yNNR6fDJgeFxlPvGBxTVbY+zrGq9+FLxC5fmhTjL7X14YGoegA19xpLLmBN2fr+9D7SG9bjIq88B4+Sk2KqyCYbsGjjLEV8y2rt7ZN/wxzuK/ny4pbO/zCAFLkYPuxJjssqV1P4rIRWSMwvW8MoLobIcy8I/xB5Zdlfep6DypcNLOpYU8QsvFF6aJaueX1CARsm0bZpNeOgkSfazaob4qtLN/2KXT3lSaMZtK3OEP79UEOzpdilSWmoxViLI1JEIrnzG+Cy0x3U4VmNiRES9aw3pDjOsdtHPeeVoGFACgThCGBweNt083wzQJq2WJHhtjBGgIy7z2R1A/pkv9E6DDhT5su3aQtr4BkUK5S/wb/3RgR4IR3nml39flv5bI64q2O23bXEeWbI4T6dGmtxbnswIQhHX569dru9ECGcU7XU6PDuIiJduG/9CM1GABsVbrUHu3/arIo2ETeWWSiF8z//XzwbBYLlcGfbbHNF3JOlCQbVYnFMcSIR+SMKR2t/J+G+X7c0+YGFoScW0UN6D3njdfyPog==</Encrypted>]]>
      </text>
    </action>
  </response>

</dir>