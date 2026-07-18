<?xml version="1.0" encoding="utf-8"?>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Xóa lương" e="Salary Deletion"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false" align="right" aliasName="Period" defaultValue="(new Date()).getMonth() + 1">
      <header v="Kỳ" e="Period"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false" aliasName="Year" defaultValue="(new Date()).getFullYear()">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>

    <field name="bo_phan" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" key="(@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or ma_bp in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" onDemand="true">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)"/>
    </field>
    <field name="ten" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 230"/>
      <item value="11---: [ky].Label, [ky]"/>
      <item value="11---: [nam].Label, [nam]"/>
      <item value="11010: [bo_phan].Label, [bo_phan], [ten_bp%l]"/>
      <item value="11010: [ma_nv].Label, [ma_nv], [ten]"/>
    </view>
  </views>

  <commands>
    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6X1rO5yYi3HOzA/8C+8/VbSBOYXh9PkpcM/j6OFgBr1ZCrC242wtnPkrenBy2LEolOvFcFRtWn2OnHPZyBjJICLzCNKXnkahjj5d+85JnNJ9P5CBhgpoZaEdN5xY0r0urAu17JnSwItwa/13YsbFAkKcdiil4envmIB8xkdHSLIu+ATqcW6LOsuqxcguS+e6SjktLCrLBoGYN5VlaIfdoKquKYYPuBBRBtfk9XtA/6DQHoY65DjYF+kVMjsV3uReYj9K/9vdN9YqECXVqlSpoCVFjALUPbpS8856EH6jj/r+8z4eMp/xsin39+Klj0WhhwWFcFs1O6/et3Jbo6/0Mie84ElXUYuHgOSaprSPL9H/KBi8EBj54Eh6lSEfF6SFhEck09cHT+UzC1EZ8GiaTvP0XSyOuBAdzi03QHAazvBh/YmOscKyKf0frxesWik1rnNUhEkU4K9R4cSdE/WxMk/n4SqHlD08h2KLtW5qZlggHd9jOYop3QOhK2lMIX+C3qD7tx4DG4JsoFa1V3mhewAlw0NEveJryNzW8WZwzetdhyRGgxQ2cHfhcZzeGPLJ6FH2DtZjQ8sxeEt5z11lVv/PW4277AF+hTwVFbi5o16Ycvkj9zhP/ynjhcWKRRELvvv5sAdFQ3X8dtWn66lR0iWvkLCaU+2Xxfht9CKl0ORDx+UKh3nt2ZHyIuuzCr0YECuKatRvYOXd5uYdotii0UTM7BZBgl6CiHSvzr7RsuzWbRdne+FSgI3J8xKvS3wNPP6SAbCwRjFVsBVQc9Lf9JGk+fBGeHciFf4kptOyVusc6MIxwFOfGJK/HV8IKPEtSYEALdVcrkcCNxvRUiPf1jwAf42JBLSn7r0eCOaVhsoFqtGyEfofP9k8XMQ0CvP9Qs/C4Erk9+enwEDOq/aO7KX+3igjy11qBOqWIZXWqh36pZhUt62DZG4NC9n6MASybA/PidmJmUqwOsbs0D93jKmaZjWjDvRDpSkUn3XNstRwwuDV+X1SPAQ3iewknJUDc+0ngTAaTRCvWGYZ+Clxd3I8XabRUEycq9G1E0Z5NKg8rS1Ty/ASzEnNwEhDVgiw/xgoKotSCZdN5mLuM5XM2F4Md2Bqi8Qvd4oPxTyXWtiMWesNB2IKY942VbfDxue8Q7wo/dsoWsb3BkPHOcqFEju7sC8VlqMghm/zU0asnc/SQtUDgi4vOm3FyCdHDrTwYuD3JYhG9RIXUwAz9R0WAUp+9vw4IXwCNDLcmuw2eVwbWT+p+dnF0uJrbPr694vq0/iNiQCiMqIyhZ6JOuEl2Oq0riO9oLd3Kc3yG0CdqGiVd33zp05lReg0PWFuR20EynEcUiosvL6IhAiTgDIqOYBhkEhsb7/xVMn6EisgjKie</encrypted>]]>
      </text>
    </command>
  </commands>

</dir>