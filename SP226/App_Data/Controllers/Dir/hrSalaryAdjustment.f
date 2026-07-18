<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY k0 "@stt_rec = $stt_rec.OldValue and @ma_loai_lg = $ma_loai_lg.OldValue and @ky = $ky.OldValue and @nam = $nam.OldValue and @ma_bp = $ma_bp.OldValue">
  <!ENTITY k1 "stt_rec = @stt_rec and ma_loai_lg = @ma_loai_lg and ky = @ky and nam = @nam and ma_bp = @ma_bp">
  <!ENTITY k2 "stt_rec = $stt_rec.OldValue and ma_loai_lg = $ma_loai_lg.OldValue and ky = $ky.OldValue and nam = $nam.OldValue and ma_bp = $ma_bp.OldValue">
]>

<dir table="hrdcluong" code="stt_rec, ma_loai_lg, nam, ky, ma_bp" order="stt_rec, ma_loai_lg, nam, ky, ma_bp" xmlns="urn:schemas-fast-com:data-dir">
  <title v="điều chỉnh dữ liệu lương" e="Salary Adjustment"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ky" isPrimaryKey="true" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" isPrimaryKey="true" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZQaXQt9NEozCfWzxHzlg1TiT9YRtngHmI67iz+2in3Y2RdShZ2yw3LRdMxizUvxEISO5eb66SsPN+bRnuEF8TAE=</encrypted>]]></clientScript>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_loai_lg" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Loại lương" e="Pay Type"></header>
      <items style="AutoComplete" controller="hrPayType" key="status='1' and kieu in ('0', '1', '9')" check="1=1 and kieu in ('0', '1', '9')" reference="ten_loai_lg%l" information="ma_loai_lg$hrloailuong.ten_loai_lg%l"/>
    </field>
    <field name="ten_loai_lg%l" defaultValue="''" readOnly="true" external="true">
      <header v="" e=""/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="Số tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>

  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 20, 80, 230, 0"/>
      <item value="11-----: [ky].Label, [ky]"/>
      <item value="11-----: [nam].Label, [nam]"/>
      <item value="1101001: [ma_nv].Label, [ma_nv], [ho_ten], [stt_rec]"/>
      <item value="110100-: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100-: [ma_loai_lg].Label, [ma_loai_lg], [ten_loai_lg%l]"/>
      <item value="110----: [tien].Label, [tien]"/>
      <item value="1100000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5fxQRs3hhLb6tY2YHgxXebz4ofMKOlIVzlVOtB4fIT9IaX/nR9cnFwMdE82YMkX0ppBqzDlW870iqH07tk6USI=</encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1xNB5iPSzsdQiYmgGM9x9FNz3pUVaOJwF7QLZASXMgb87PEUuigzl4CrIBpivDXMvfH8ey4EtdTTkmq20Httocv5CKorBHY8UEAu7iDM9bd</encrypted>]]>
      </text>
    </command>
    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz8h2R94E9vjRHnJe8iFc1F68VkRl+n0ImLL6n0t0W4bufLUoPq6dd2bcwopgDDGLAHyqu7LK+j65ApMcNwDa/g=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6TLfoWKwwcQ/O7FyNadU2tk1CUaqVq1aM8LqGcoVzj0zpdK6Vf5KcWjlr9SRNnb/onicuXren/WcrtZL2iQIfrUDoSYX05IGqJxKSH3UQ1hq+eOjsifxGAZ6EcfMGsn9a5VNCgeFqOxW/1eQIunx//lFlklFfKuI0ji+Abv/Qorqvs+EaLCGyi7BK9ODEPdWin6GWf1YyFjaBsm/6hhkg0UDN/51kBaJn+bJF8/NrxzRAH3g96XjKzzhcwAL++GV/QIesaU37oIIq3oBhbZ/NtI=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WaN8MSyJECa5wYt3cvTqaI4hEwN5Hy9asCNdVnqKPSum+iJSlCsN1dH/zF67zmztrQ3rn2CspKXNKQD2yZzfShfeP9GiWPWWnlElL7pW2RI7qxvLa9peFUnWXeKjACGqdXQjAunzOkoDxNFWc3sHkqF/2rAQmTBjmP/xbTtDFjRaZBz83Tvk2Ka7JGMJWKNb3Q0vTgMR8qBfWpIy1BM9mkX7x8FEmfZvlg3SEaMrE1bLq4mLfj/dcfN1HZGdKVjyJ46kW/QCMwNQ1iupgSfobYfGN2O85t33qDHvbF+ZuQSogAffD1ngfb2mD1zVpl8m0q7+iFppCofiqcu8YkiThhafwlJPVdn94QSIHroZHnPi6Ft/yuGCQTWfbUnz6m/geAJ0f/O51zTdyAo5ceoXnMhFHrZBv/kFDVlPXq8qmbHLU8ioC4S1tLZJBX/MzfRpi97WPp6pK3wW4lczq5Us9ewrHg7wYEX8V2nH1wzSnVYj5peCBT2P8rE2qPiUdPy5I</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3chGulZx9js/QAMlXiOyoG+w==</encrypted>]]>&k1;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cN+5r5DGxhHZBSzn67khvmhXBwNL/qVCSB2jd1sB7aVmr20A64guqG+v272NoUJPGI3/argsoIFNolqV/Mk46kStcy8U9yx3W58kadp0KL9BCfNNVGqEivFahCvJjP8HVknZmNnCJysbys8O6mlDwvkFDJj1IvVUT0QrGlWWiBeE</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jHIfhvN/FgzGs7XWCpp4tNw==</encrypted>]]>&k2;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cN+5r5DGxhHZBSzn67khvmhXBwNL/qVCSB2jd1sB7aVmNbc+aFbzZTinjL9Tn2paahQPuNKbyaNmfSmYdlSgTsTU4bb/aXoMr2g3NsQ3+1uBuBSyGIcGce76n5o+IXvBCQ==</encrypted>]]>&k0;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cE/hpETWHna8gLwEu3sbtN4/gTNFFQu0uenpQvEOpfKo64C+/GJR6A+stLGmvWCenQWjmiZXH5Ms/sggehN2p6w=</encrypted>]]>&k2;<![CDATA[<encrypted>%ShDm4LooPFnWfxWGAKIehxn5IEU5hwC3K054s/5gYTI=</encrypted>]]>&k1;<![CDATA[<encrypted>%ynJ3B2IMttZ3swIzstMMYbqlZD4zfaX6Mwe4vIA/i8Y+BqYp2B9N+ssyUxgIRZKrz8caL8xDHyIoHpIJjsR22isZempkB5UHSmZRptihho6ur/BAsGzm29OVWtoAg7Ma</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeqMboCxcWZPqmgVHI4rxdBdE5v2XLyIc5gSWiGIG4xro</encrypted>]]>&k1;
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FM8YnOQuI8ZWnSCiEF0Mtna6s0iZR5uWMGewFWYCy1Zst5fH5YadTe0lTsxeiRneDxuZVTCL30XeyKXZHqFt+RRjeJMiEVl+NnGbyGvAWLU8x4lhlmGpCfvgVYCDwJLK15JFzB9XSrvhq97go5AtpHJIoE0BJm6+aNp3t1kRcL00/5vkeJy+VmO5AF684xlXAGrVzL3h7p4rSpwDWsCixVzfmLCBOpII17fkPmPMVzYWGk9yobaIturlYDZrd4vDGGbPZBf+jE2e0DlbjPTxFuZMOdi9tAb9nVMJXTMM/9inUcRDkFDfHYicM6wwSZmii5+D830Vc7GMce2Mi5cyDN8xmq4Bm/cP7ASodbvgj3SINxFPqGG1yukVkSqc1uN9mJWd2FNQwjTBUNQTUTCrNEjBhuM8DZq4jbccd7z2cLO2Q6pqfCzcXAkTjZfKNEPdw+DJ6U6YR6bF2GpQhZbpybQ78hIn2e9DD+ZKFJS7ha2MWV8WQTL7KUo5wGSzWiLybRujCAER5/0I2AHTJb6gBYnnCo5HEXT8QKNAvzBav3IAkWK2xNJx86VL5lq0ScAXg==</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="IDNumber">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6Wdyk9aPi/fGimY6rlT0N8nVAGzan76LcTwu5Z5TgGNe1NWZAFthZQVFXCS3ORqLbPILfY5lclrzI1lzkCB9izQcDmPERv+f/FcKknTu+wPw==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>