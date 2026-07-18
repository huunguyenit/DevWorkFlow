<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Key "declare @rk varchar(16)
select @rk = lower(left(replace(newid(),'-',''), 16))
update @@sysDatabaseName..userinfo2 set rkey = @rk where id = @@userID">
]>

<dir table="hrmailbcbl" code="stt_rec, ky, nam" order="stt_rec, ky, nam" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Gửi phiếu lương qua thư điện tử" e="Payslip Emailing"></title>
  <fields>
    <field name="cpass" external="true" defaultValue="''">
      <header v="Xác nhận mật khẩu" e="Confirm Password"></header>
      <clientScript><![CDATA[<encrypted>%/SjCqBsXcIoqRaqcL3p1ts36golF8ur4r4Qnq6lRtP5I+LMRVVTCDYR0bnCpItFqWuqxrcCE50IrrGzdMoOWqQ==</encrypted>]]></clientScript>
    </field>

    <field name="chkpass" type="Int32" external="true" hidden="true" readOnly="true" defaultValue="0" allowContain="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="action" hidden ="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="keys" readOnly="true" filterSource="Infinite">
      <header v="" e=""></header>
    </field>
    <field name="ky" hidden ="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="nam" hidden ="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" hidden ="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="type" hidden ="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="form" hidden ="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="209">
      <item value="120, 200, 230, 0, 0"/>
      <item value="11-11: [cpass].Label, [cpass], [chkpass], [keys]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &Key;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2Cb9DEg9VFeHZcrozoMSzfFD/WNKZN8bu6KUHfZEi7F9Hrm8bLDOs6RT/1ntdsew4neVfZfRCMHWq8AceXJVinNdx/bszVuwDJfZxxSCZPo</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6RVmNi0O5lsMUjE49SF5coQ/AKBZ/KJR6pKeLnVMvA3MrLmf24GjoKM3BCHC8MUsaOCz2oyP1Ma2/Bu0LE3GM/mrltYBuJ+I0NYTD58EB3mydT/yW+RP8GTwTD22x/UYESa6w2bMmlII8R7+eUHPYxDV3pMy5IhOCOvkl76k7TYHIASmnKX8/iYjt6cemHTeJyPFDpzo1iBJ6o1dP1jzWSnIqZXGWkx9as4fIFygk2pY9X2+h9JmpHTm4Ahn1gdFdq6+h7C+gEMeGnEQA1Ji8onZtPEUuzSJZwe2hIZqtdU2lEpnJzGZWMReOoUyB2i38JDVoc90DOg6hdVymEbUm0EIgqVyVIDHubuVq6hNjYZz6XmyA5pwuq3acTreDKG6zA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6dXWbZTKDy+Sko210bcGJP4a/mEFUDlN56pJkixuOCUyrFPvRvXgSUA8i1DhsSg2+9ZVW6k7iEDAm9VMmb8h5MGloZ8pSKTb8nDKVpp6yb5Vw88JsMFZqID/6sSnaYwfEeGYeDw1sJXly2egSl60tCXSAsecwwk7+bWdCKFGvpTEF9ImTuN9AiBXoK5T0HP+vu+8BFMaWZmYjhrDI0BagphHDfTaRkaBeWG/lzFmQSOjMb10kygh65qCkDLnlP7A5xLKoxmiaYXHayP0KtWTZIyJmsldXQoH9rqGrxe8+6P5</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%dUxtAbG76hDnHEpXdcWHxzUWYCSpQyMKk7B1lWPHrqbrbvR5JItRxMvKUFywQe1uSGjAxkA74OaFPL7DG407K4STfPaIdvLafFIHHNFbI7Bsutdfslya6BjOYmwj9t6vWoorIYea5eYq4eLfYFPqj8H0O7QSUpqMKZ/oYlWtGghbmzUSIEuJymEwPipGGKgLHLw9Y4huMcS+/SqP1pK/sSB5r09DJQUHOOTG/XIKZVVV77Vx1Z4uvypPE8yFGAwPmuiCkyaxDh8P5tfyfzGGSag1i+Xydwj+DERMdbtQCR8Jzals8AqwEEitIobNIIcYFUHUqD2VPUTJdk5DNS4vMssn2xaCNhzcpLeumAyBrYukvvK0lCLJuf2U08s7/AlHmbcv8GemwUwuuFMJ5c3TAJsMXGZcuIJce+hPVTQjR9NMJlSKSzzwdlfDGScccuMluxFU5ZjsEGOBg5L9y56C6A0sF8O7yaV0xHLfB1+5qYorS1jfw2D9hu5Ood1lfvri6R7zAQYqoqcg9bCsVnhep5wSErcUVTjbTmedIRyP/mB5SHEwXoxfR3BOX3XWHoo5eMzZ4DhDu2VKi66ZGreJP+2hoH/tz7aAuKUj99d9RCHuKwKx+EvFEIrtwafORTa1</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FljkP8NUm+FSctPijGXjRK24dvCNaZDgoXTdfx06ih8hNhNWH+30rNLg4bOwKblVuhdQrIwqJf+jnsFDaXmebDUfAOGhdJseH2OcmvYoLC48G9SKt+S71ZjhqZfoilStQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KXS4vuR9ZD+wIst6qi7fjnYir89Cgby4JOJ9IXDDbqj96dDu/6xpJS5M+cYnlFagMi46C7FBeA+VXCN5Q/6Up5YvXih8JKAzguV5wOSN9AZBUEZ+jGp73q8XHgevotSfJNqsna3IA59mJU4KYqkhfqR8ODGpTJ0VU1YLd7zYfsDX/Cfp+Jf7Og4r7JX0booZWjdMHh1QjI1gOdltr5mIcx7IknBstJYbenKO6QLklLJmb5Z7V5/zwHPRXQJbrRB2cLKWYziOzQaQO5f4F+jMPXwYLx2QwLB1OIOjJ5tMOyMPt/UvEY1xoDAWmKaVrnsm+mDO5czviD8tEkfbLWe4ZcyPVSBnzXoeptZphZ27a0DUF9E4VzccWumOf2c67xTiPxUhYaAyMI3j6bEdtFrQGutiCiB4ATjUC+sEWWuEmosNj9KnmQ1MC6AF3H1YyHiwhWOloFhNSBNsj2Xr8PEeVx/wTs0eoPYyFMP/Qpncouly/hxIf/P0oFSGYP4qhEtEEGLba16u5jz4ERl1qtMFmj6E2RwBwtBP536hswRDVBBYIucArD40GR/vvMf/bQ7AqrZ3uzF4fYQLWf6M/dhJbM3VO4baqT+2Ub6H1O1QqxgzvVf5Ew3CQ4J6xb2P8tIQSzICu/GdGHnCoqM1Zmey+enCDC20VzJJ7FHE0Rn+s2f35ShZwKDiop0MxMpkG7J35uxZ7PGPeYDRaNG6EzuXkbTI2ccQD8iMpKViAPdgWzeJdQ7YYxsGz+Pzx6+kKaDGSgJwjJZc0SpFMzPBm89lAq9PYx75XrpuN4sBhecFUdy7wMoTn8+PSL2EZWkV5gcETzPcX2fZwmQZTXZAMZon3bsPOTG+o0KdxZh1b6Ri2ncnCEwo9LGo/1qa/OiIzDWdw==</encrypted>]]>
    </text>
  </script>
</dir>