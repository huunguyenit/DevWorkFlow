<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ControlFocus "ngay">
  <!ENTITY LockedDateKey "ngay_ks >= @ngay">
  <!ENTITY CheckLockedBeforeEdit SYSTEM "..\Include\Command\HRMCheckLockedBeforeEdit.txt">
  <!ENTITY CheckLockedBeforeInsert SYSTEM "..\Include\Command\HRMCheckLockedBeforeInsert.txt">
  <!ENTITY CheckLockedBeforeUpdate SYSTEM "..\Include\Command\HRMCheckLockedBeforeUpdate.txt">
  <!ENTITY CheckLockedBeforeDelete SYSTEM "..\Include\Command\HRMCheckLockedBeforeDelete.txt">
]>

<dir table="hrvaora" code="ngay, stt_rec, gio, hs_yn" order="stt_rec, ngay, gio0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="giờ vào/ra cho nhân viên" e="Item"></title>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99I+qBtTtKcMGUXHMVvGKiGcRG3MqGu+Dq+CRAQNRs5F7pfaLL126DadAI+VwCiKtPSoZUqeS2urQCCM0i2c+E2k=</Encrypted>]]></clientScript>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ngay" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày" e="Date"></header>
    </field>
    <field name="gio" isPrimaryKey="true" dataFormatString="HH:ss" align="right" allowNulls="false">
      <header v="Giờ" e="Time"></header>
    </field>
    <field name="gio0" type="Int32" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="hs_yn" isPrimaryKey="true" type="Int32" clientDefault="Default" defaultValue="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="hs_yn0" type="Boolean" clientDefault="Default" defaultValue="cast(0 as bit)" external="true" inactivate="true">
      <header v="Hôm sau" e="Next Day"></header>
    </field>
    <field name="vao_ra" dataFormatString="1, 2" clientDefault="1" align="right" allowNulls="false">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Vào, 2 - Ra" e="1 - In, 2 - Out"></footer>
      <items style="Mask"/>
    </field>
    <field name="ghi_chu" rows="2">
      <header v="Ghi chú" e="Note"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230, 0"/>
      <item value="110101: [ma_nv].Label, [ma_nv], [ho_ten], [stt_rec]"/>
      <item value="110---: [ngay].Label, [ngay]"/>
      <item value="110--1: [gio].Label, [gio], [gio0]"/>
      <item value="-11001: [hs_yn0], [hs_yn0].Label, [hs_yn]"/>
      <item value="111000: [vao_ra].Label, [vao_ra], [vao_ra].Description"/>
      <item value="110000: [ghi_chu].Label, [ghi_chu]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CheckLockedBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHj+qpqrYi1uSk2p6sLvrQJy1rtUI/9PKdrAffUCQ0PL00vfwJZqcIWD9/mPJ7L5Ym5Jhgwiar2ZsdQa17wv4KwpPsgyuFUSU04TUZcBCRPa</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CheckLockedBeforeEdit;
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAnfmKSAJtKy5hx6O7sHsw6qFYHj8a6LZXLvzSFZI+K9Z3NDvBv0aR2cCw/FtDs+hiqa+gD7ESuWgkn0TID6QhI=</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5wYSL54cQwpc6EiB1XHUdKnKfGkdadgCzywju5Y87VG5iVj3qCYX+gKcFp7KFCmUNPvUWYSAlGCWDShf5tpo2Nj9OitWtS0mDG+08JpdoDlTNCPmWbunh+F41rYjmhr6e09DRIClTPvcNWCRCdhGm1tdTjkLLciVjzlKnnBwHfPvz9A9HQOawWtz6dgh0mnzHLHAmUK32Jex1DpE52CHPOGm0PyXNsAyVVD79WyF7+Jk4tA543vjCZ2v6nzPKUAKcht1DVFhLkyGdKPRCHv4o4=</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIkHibOl3ERiVHBlw5eAxDeKZyQJHRr/+gq/RT31OTYGrOMP/c8W2+QzJTIsqy39svxZRZ8ixGuhlBZUMuSbqJIH1shLAaRWF8Ap/wSgcB60kBsstfS4NZNjiNzDcCQpGrHoLBEgj02m6DZ3MXv2nbGBV25fXthAOjjLoPK0vH3NLOQ8irzJnr8LMRWhE6f4VzCc9Yxp89D3fLKZBldcKq7GVjPkDv3GqPOEF3OAMRv1PYIp3a/EBnFXQrHHY5sVNN83Z3LiIXPkT+Pq7j60e7+/OLI+E4xCqLfMZiJTvuEF7l7A1aFUQUitq3lDiDaOBS4LygsydJZFqAo/HRT79dXh7AOUO2Qh4J2tAgQJjhkfbAK+0Ff8Swj4NSeB+EZu7+9HCm2KbazOSyCpPkO7Dt+g==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CheckLockedBeforeInsert;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwU79VyRyBChN7cVg/V7eyUlX8FMbeV3mZF9BDFZ8eqOi5/ak3sCwFhxugeY1mgx6gXsrPie07Y8nopmmgNCCUc8+LlLQ4yhWd5nL65UGk2NnatylcIBbDrkTf0J4hiNLHR6JGKRPRHkdqNzzWNhk7tac00GyqHC60pd/xq9kRo/fw4bgte72WEliBVFe8Isk0iIyAHRCgxx/XPHt5SWYZJOLpUhBNP/8K+vHElsB+CyiehaFa3KE3bcBOTq76JUp91HNunJ3ypUwsTnvAop5ul+6dMIssMGkhLnWPs06oUM0SBDY4i0aq4qdfdZmB7NYZwzDYYbjj9JmYJ2w0LhTukH/QtoRdKfuIBBrQ5ki7w+lw=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CheckLockedBeforeUpdate;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLt1gZnr+6J8/wIj91pcYrERY4z1TV02HKmY8eC8Hqr5GRVee619nSnUoZ5qO1joCJKL9rqnGNt+5W8farVdeWgZeaSk0oVGZT7LMPrfyPemTaCKQ5RLf285KzivKJruIVcoA2eNkIpfxFeHwDEelE70GAUHk2JJYwxQXNoZ+6J6OnpTTM1RUPSoru5a0sXBUMGJV5m2IA4PpW0ApNRb/yho7unMWsl1vRUfKc8mdBZ/kiZitKGrJ1q160rCBwmlSaX+ROI3MiEejHjjGOEqyU1SnCxKeiAMy5/5jptDc8WBs=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5yxEjvycE7feRIf2pZ3W2T7PXYgkIaCBQhbuJtCXwnvHY2geUYP/FwHqVwxNDo/CI6j+L8Nd9LmjiIBpyosrDQRPgv6hEENI9J0s4ZHDL3mDz9lhMkQvaRV8sQE8GtJ2Z8rW/b4V8cehLG4fu5Ab6qpbkUUwUClVHiYpT+RZ2J0BO2TzoSG+d3JdtTOyhBP9aKn9gG3sQk2bzhr5PF06QNVFls+VayqNGHVTu2ELBPVr8s+6okejNJxV4w9i979YvcKAEnkMtzZQFawKAW3VbMkbX+2d4eyfq7hqh+VUAVS6A==</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CheckLockedBeforeDelete;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&HcddcFhSZ/AMuD4kh40f9kRHoYqU+D4rZS4Da36DMZa1+k5OMz5FMUT9EhcfYwN7GrEGuZk4zyb0o23/BMs3bejNFV7IMKACk1Jq3EUDsog=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtcUTywWAtjp5kQe+T2zsL5cCLhrLMpy8t2DQN6nCyVG4yW9+u5ghZx2Aq86LSqi9vwWa/th5TCmnUPI4hZpKl80CszHHSP7qgg07N29I//qE7aF9AdOXXhHK9CQLifsH+VDm4ZxOHQTMm05dilgTbqagkxXxC6lJbIQ0YJUBYYAtc9X513zTd1RPMamccp86Xb5oWXrUKb2xxDvw+9NtI09Y267tLSGUW15gqKljaURyLqOHfmhsysH4RqgRPIT5KGUxeBqUqoi0W9WVzhxoCow8Nt7bAZsLSx4s056qOplBCdGE8K0myx70c42rvJNgPCFkgRtaAg/Q6gkEXrbvrbY0T7ItinO1WkMUgPdnmRcw</Encrypted>]]>
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