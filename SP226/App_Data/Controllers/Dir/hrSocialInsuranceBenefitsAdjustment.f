<?xml version="1.0" encoding="utf-8"?>

<dir table="hrdctcd" code="nam, ky, dot, stt_rec, ma_tc" order="nam, ky, dot, ma_nv, ma_tc" xmlns="urn:schemas-fast-com:data-dir">
  <title v="điều chỉnh danh sách lao động thanh toán theo chế độ" e=" Data Adjustment for Social Insurance Benefits"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="dot" isPrimaryKey="true" type="Decimal" clientDefault="Default" defaultValue="1" dataFormatString="#0" allowNulls="false">
      <header v="Đợt" e="Time"></header>
      <items style="Numeric"/>
    </field>
    <field name="ky" isPrimaryKey="true" type="Decimal" dataFormatString="#0" readOnly="true">
      <header v="Tháng" e="Month"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" readOnly="true">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99OxL+KJ3sqddOl3l4Hu67QPNUS3KFoOYXRqfimm7dyiDN9/+tFM0HHGQHOOrU5e64JjkgctDi2s/t3/bi4vNUyJPmHCsEPiAGO/mNnOZPtvj</Encrypted>]]></clientScript>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_tc" isPrimaryKey="true" allowNulls="false" allowContain="true">
      <header v="Mã trợ cấp" e="Benefit Code"></header>
      <items style="AutoComplete" controller ="hrSIBenefitItem" key="status = 1" check="1 = 1" reference="ten_tcbh%l" information="ma_tcbh$hrdmtcbh.ten_tcbh%l"></items>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99OxL+KJ3sqddOl3l4Hu67QPNUS3KFoOYXRqfimm7dyiDAybg/f/9hiegPRXytvWjI6G4vChgvhLi31APaeyx+AQ=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_tcbh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="dot_xd" type="Decimal" clientDefault="Default" defaultValue="1" dataFormatString="#0" allowNulls="false">
      <header v="Đợt xét duyệt" e="Approving Time"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99OxL+KJ3sqddOl3l4Hu67QPNUS3KFoOYXRqfimm7dyiDAybg/f/9hiegPRXytvWjI6G4vChgvhLi31APaeyx+AQ=</Encrypted>]]></clientScript>
    </field>
    <field name="thang_xd" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Tháng xét duyệt" e="Approving Month"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99OxL+KJ3sqddOl3l4Hu67QPNUS3KFoOYXRqfimm7dyiDAybg/f/9hiegPRXytvWjI6G4vChgvhLi31APaeyx+AQ=</Encrypted>]]></clientScript>
    </field>
    <field name="nam_xd" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm xét duyệt" e="Approving Year"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99OxL+KJ3sqddOl3l4Hu67QPNUS3KFoOYXRqfimm7dyiDAybg/f/9hiegPRXytvWjI6G4vChgvhLi31APaeyx+AQ=</Encrypted>]]></clientScript>
    </field>

    <field name="so_tien1" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align ="right">
      <header v="Mức hưởng cũ" e="Old Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99I331cUSBHb48Um6/MIxKF1XV6h6gBP5Nrw7p4fZnjgbHdBPvZqr6zNF1fxMeFA7AtkBwKmLmU0lte7G8fGYfg4nzT+eBnfFivVPNJFwejso</Encrypted>]]></clientScript>
    </field>
    <field name="so_tien2" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align ="right">
      <header v="Mức hưởng mới" e="New Amount"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99I331cUSBHb48Um6/MIxKF1XV6h6gBP5Nrw7p4fZnjgbHdBPvZqr6zNF1fxMeFA7AtkBwKmLmU0lte7G8fGYfg4nzT+eBnfFivVPNJFwejso</Encrypted>]]></clientScript>
    </field>
    <field name="so_tien3" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align ="right">
      <header v="Mức hưởng chênh lệch" e="Difference Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="so_ngay_cl" type="Decimal" dataFormatString="### ##0.00">
      <header v="Số ngày chênh lệch" e="No. of Difference Days"></header>
      <items style="Numeric"/>
    </field>
    <field name="luy_ke" type="Decimal" dataFormatString="@generalCurrencyAmountInputFormat" align ="right">
      <header v="Lk từ đầu năm" e="YTD Accumulation"></header>
      <items style="Numeric"/>
    </field>

    <field name="noi_dung">
      <header v="Nội dung điều chỉnh" e="Content"></header>
    </field>
    <field name="ly_do">
      <header v="Lý do điều chỉnh" e="Reason"></header>
    </field>

    <field name="ht_tc" clientDefault="Default">
      <header v="Hình thức nhận trợ cấp" e="Form of receiving"></header>
    </field>
    <field name="tk_nhan_tc">
      <header v="Tài khoản nhận trợ cấp" e="Beneficiary Account"></header>
    </field>
    <field name="ghi_chu">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 10, 60, 0, 30, 70, 70, 30, 30, 100, 0, 0"/>
      <item value="110--------11: [dot].Label, [dot], [ky], [nam]"/>
      <item value="1100-10000001: [ma_nv].Label, [ma_nv], [ho_ten], [stt_rec]"/>
      <item value="1100-1000000: [ma_tc].Label, [ma_tc], [ten_tcbh%l]"/>

      <item value="110----------: [dot_xd].Label, [dot_xd]"/>
      <item value="110----------: [thang_xd].Label, [thang_xd]"/>
      <item value="110----------: [nam_xd].Label, [nam_xd]"/>

      <item value="1100---------: [so_tien1].Label, [so_tien1]"/>
      <item value="1100---------: [so_tien2].Label, [so_tien2]"/>
      <item value="1100---------: [so_tien3].Label, [so_tien3]"/>

      <item value="110----------: [so_ngay_cl].Label, [so_ngay_cl]"/>
      <item value="1100---------: [luy_ke].Label, [luy_ke]"/>
      <item value="1100000000000: [noi_dung].Label, [noi_dung]"/>
      <item value="1100000000000: [ly_do].Label, [ly_do]"/>
      <item value="1100000000000: [ht_tc].Label, [ht_tc]"/>
      <item value="1100000000000: [tk_nhan_tc].Label, [tk_nhan_tc]"/>
      <item value="1100000000000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEvHZXiQAxFJy3QspPz5qmIfD2ECIFbhKUabHQjbLg+MpYR700hsqocc0I2lVG0aZ4aWt11K0lAC53svAGa4LBMT7LyobBGZq/UlE+hOe1Bq</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOSqGUd0XtrGQc3vonITmkN7FpeiZIdnPio7h10CP1HY3bjEnzl4ObLVsP7LkMmpDq5S0CYywGK5L+Egwf26mdBJSKe7uYpzreRDXQTq9oJSa40suseBsRc2twuydsKAuw==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcILMWGFaIIJF1zE5r7UX4L9ZjsVZqfljYMy0AbbFdOxMFH6FpmnnDggNIkiWutQ8VIjjF9hCrkoZhoGoHJh8E9iCS37vtm+lm/SQdYa037Qp</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNI+saNVRqO0lcJc+E/2wzD8t8NwkCBJtZ+9wwSWxt07d8o1AdgEwBTc0zK1yRkNmNrhTKICspFEYDfpXxtqs2S/JMrdOI2p8F31DJml3taMxBG9kKyzMN35VMwCWwUORkayUTY1na7q2rvti+EADHpxHmbJqoqZqhkZECXc1N1MQgelwXGDnjInSbSQd8m0+iC1TofmVkWXeCQkO8rOXUkDFuuC0IjHo2xJMAG7hkSe/eqAnfxywTF5qRbw1sGaDnWr7gUh1rt8uOhargqqFET3EfOTc8LJcJHeErVuafMrbGXMgvEW74z0nT57C9uwMfBEtjcA9Va3rX+Gz4SVp1kD/ryjgRgQ0vYhXrco4xOBYP3++zSwTD6JGEGmdYZfJjmhh4Wvd5KsyE558Xvjhq8ukQiShd+wb8/3dbiRP1SRTUfV7utWveGMa0vA5Ca2OoZ</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5wYSL54cQwpc6EiB1XHUdKnKfGkdadgCzywju5Y87VGdCNpd4KFOwYQ3UljlWMVXlKFtOLx4LCbu2rM2T3SERfAKf8MLpn4h6Pf1aSmLg7xPQuXZpWsRZ2Yhr6juAgXEPJ8lKuVfg3TcbDGp+IMVvs3Fwxztkm+CcUxgDUGo2uNgDAcrd5KCJCfZIhWPV60ag==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwU79VyRyBChN7cVg/V7eyUlTnK27p6nRleSVqYHmjtuPrS+7mB1v+rI+30X5trZ5+NWxqydifdK5WA6WGzp1ySiNN0x2jiAwZExgjrNjTQkwqDzcQd4/z7WxfhOIVuu9DMD3H67Zt1mzaHPKkkgtF29PqKGzB6Lz4b0eSflBR/l1VoIem4ZgNhA0Q/5/Fhts2aPi9K8daV3Ys5Qbu/KhX5NyHl7lw9Swcl0R3lMtazOsBoQfXu3oNDmsxqSFFMFsxP</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLzHVitzF8ntYb6OKtVQ4RkzE8wP6VumY/secLcsnwsBnzhIDsGXs8XFpGWuwAVEQ8EjyOs/16tVyEyYtkaeye6DijgFgGeGdbiH/SeJXP4nqMM8AnkMHPORjUaieWUBZmYM5bDoPY2nlwPiev7euuPwqSNl+zfd1s25Ip1e0I+YfXnIU8efpg1QaSzRjL0ch+G15ZypfmYUAiVO71fjeHJPzM80TZK5GrNp5czcPBGYbJAfgxOD8ZuMgev6nZI4xz0yWnqCrSQkfPl5C1AXhhshkP7IguRUrbM3n6q0h6k8NV1AbowK8ddUJFuHIE6iiIAWNJpF9YPW7ZI1aapHEBTg10pR/ORdb6IT1ATxHfl+w=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV1kKnbVoNF2njbwUgFKK4xugUN13qRrcllSySvluM6B+4Hf1P4pGuSwQu7o6lKpLKAx5JdSyxOBlecenIH3NBEI=</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtYs27dRTKriqicsiqBxmrWmhul1Irr15GYVOB4BuBwWVKOXNZ8aEmxL4QRG3jI5ZADOWAxcfHPrD6xB6q7w3V5rsLQ40mcdUY/ZzrCGMddSa0VxC/FwIXeZTyaXZ7y+IuMC+ORjevT1xvrIvb++iB9AvqHiTwVjloOd5YykbNcgIMxxowRmfDaxoOSw+lWQyXAGV2mgW88UqFizMMwb3Rn8dTunLCoUpQl1rgkM1sDqE9qCjorBCWsW5iWiPxSNEtGLvSYBZOGAn18cVRjVOpuTy2KBKljsutLtzSS+oYPK/QDNlkq9PW0WEgsd34vXDgLy8mFa0o6RFFcY8uoVxsv/uUFBjDaelkNAZEcAMoP2VqSYtYLyvZ/aeFEOwMM0rGZRcxgjeA2W1qAIpLnXgr1JEioQLJgwcuP4cn427eFIA3evkpK1IcQk415NJ3kI371ewKN7xO0k0mS2m1Ik4ZwM5ZaxGX9yVW06OTNrBtW0di7poxTS5s57Umj18NiqAQ4rWmXyUDsVLcY8I0rQ8krDlLYEF/ugUHXgLZpFZoe8TfExuyflpJL2UYuwQqAOhW28BbAUlNZIl+nMu1eIC3vJhEfoUAuL/lQ6khHIPIKv0355ap4wV1+KLRHsMC3kKB1ELNEb8ix4nF3GXPAX0gBy2ogtRO+RLN2BjTcc5BhRUG5wouOQjqtiDWyBI9M0N+n25HQBwxdEcy/gLOPkpLEVuvbTPYaAw3pKAIQb09kqZcrZpydluwNmCtDxZLcnzoA/VNvC1I3a9GYNy94Uw6T8=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="IDNumber">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5p1ONhnQ/dVeNDqmQY5tBTf9gniI5ZdZXG2dYHCvwCWPYE4JYt1ZuERm4x08hYdNWf8TdBcH+IcMzfOfWpooKZkQuw+G0Bc3oHQzylfss9XCduB/geJD6dL+ZrQyNus3KRvYx/KF7OT+3CNv4Vrcdt1iQbT4eQ+5EuY/TVxr2uzUw2rt+SZQV51xY/yMml47/QTuIhLcU0Bg937yOEczH57bUxx+bm8okZ/uORiMllXvOOtVGGJzuMjKIyfqbq0ocfZSBAl66J0ZXZJFVBgGeY</Encrypted>]]>
      </text>
    </action>

    <action id="Item">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5F28Xx8az5xJvHdZ/7bVO3mfMgfNfqrFGFkQ+VVkESh0whYbV24+n6YRc3FW2B3naOIopAQPLBLIVVuo53QS9DBOgtPSNZ17/gURsoFjtRPFneOvukDKHcoS+IENfn9sjqT2mBVeWXS/iTgprTeAEZ</Encrypted>]]>
      </text>
    </action>
  </response>

</dir>