<?xml version="1.0" encoding="utf-8"?>

<dir xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tính lương" e="Salary Computation"></title>
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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6X1rO5yYi3HOzA/8C+8/VbSBOYXh9PkpcM/j6OFgBr1ZCrC242wtnPkrenBy2LEolN3Ke1fwUo+idgvb45CD6EWjZ/peR+RVo7dVApKJ8n3pK3ImJjaTUX7eexUxESG2XvgLMS0CUY1VS7Y7xTxjevgp81AkyWTHXHEEEYqwPrDIC8ByfsNdAHsh3UUb/436gXPHFlFn363xwi2K05XIDjYOEgXLXSzH4z0w5v2Hzh72HafcDgN6OzntK8gKD0XXoQYCFzRnBLIE51YqVwOZ40TQcGLpX3zg9fASAuL7xmsTiGMnDauoqBPZtoNaTpWTrqlpyTKptgq5qPPPjcu905Kk+76gtr+VJj24dVNZkg+y4R5HfPTGhuQezgObbkAPQcP4UkdqoU/CqnIFxEEC6Kp3ER8FaGSmRnICbX1U3EA462TLBb+Ec4jTtNwQPn47sHqFtMZYpBC5RL1IGlti/UVGpJ4Js8/1N9B/Et/RUbFgIEi+5lXeIHXg3aAv/TudR1DTRgoQP8LJtqfsn8f5oIn0P2d0cFwVc8ke5TBZUV0GRKhlgOp350Wj7ACDZGKXKE207jF06H3Gv68TYF+dr5vvKQXlXNnBaXfaghupH2800aFCDUH1ozGW11wSOAWgM86ISPd48fzWefqQddQzv9SknKxnvgBqejEHtLLIAIUWxJOBGEhz0pqZRFnxNv3W4OiyMjD7dHgB2BModJyevW4TbN+fK3df41UfbxiN/Tf3vS//TphyJCgqcLUcG5lHs5ZcA6QyFrLnCMmx6uTV/5sphVw8IF8Qrj5DNQvpR8Yjnl8bAK9B473OV86uahAde+rjwYd5pYWVKCtxKMi0h6RZRGY96+kMRckh7fCxbhReEm4H28mQiMwAfwvloe8yZrQ5nFokal2Hp5jl7llfOFd+QDW7LNBB2VnFUKMwhlwugMnvXoJrQiOxU5KQcssCGF86GrIyqqh8VnXkZ07oSune0tsUtCP9KCwDI1hdPhuN2TV9LKJlYCvXG2ODYa2VU1ul0FsDv+Fx6iUbLvR9MSxOT0O9KYUIFft+IszArN7mDu+yMrKdwLikvz3r4ILUgezRFQCOC6RkWzABJZObdGkqZ7zjdjfJDAtQIkXPpHts3zk3/X/bnf2xUCsjJSZcb8QZRPiS94l0nG4vg74mJBQRAERUb15zokTn0ns5LYGD21G+7j7KJyxZdzvV3sIjxT5QsQFLBW8YdkAhaQ6AkQ0muMqUcQ091qb4dV/TW3MaCrQMThx7wHUM0lKdvDBRZoc6S61q9A40ntpQdC6KpNLN1wSFAo1n3QIVGlNhYpGYkgWqQMK5hkiQc+VcF72kA49Q3K/aTejFZkJIXAPHhfdGgyMgdBVfb/nCLjBSL67V</encrypted>]]>
      </text>
    </command>
  </commands>

</dir>