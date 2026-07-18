<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY ScriptIrregularGrid SYSTEM "..\Include\Javascript\CheckGridIrregularCode.txt">
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">

  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">

  <!ENTITY AfterUpdate "
exec FastBusiness$App$Voucher$UpdateInquiryTable @@id, 'irt', 'phrt', 'ctrt', 'stt_rec', @stt_rec, @@operation, 'ma_lo_trinh'">

  <!ENTITY UpdateWIP "
declare @c int, @s varchar(33), @i int, @$ma_cd varchar(16), @$ma_vt2 varchar(8000), @$ma_cm varchar(16), @$ma_ccv varchar(16)
declare @t table(stt_rec varchar(13), ma_cd varchar(16), ma_vt varchar(16), ma_lo_trinh varchar(16), loai_btp bit, ma_ccv varchar(16), ma_cm varchar(16))
insert into @t (stt_rec, ma_cd, ma_vt, ma_lo_trinh, loai_btp, ma_ccv, ma_cm) select @stt_rec, ma_cd, ma_vt, @ma_lo_trinh, 1, max(ma_ccv), max(ma_cm) from @drt group by ma_cd, ma_vt

select @i = min(line_nbr) from @drt where ma_vt2 &lt;&gt; ''
while @i is not null begin
  select @$ma_vt2 = ma_vt2, @$ma_cd = ma_cd, @$ma_ccv = ma_ccv, @$ma_cm = ma_cm from @drt where line_nbr = @i
  select @c = dbo.FastBusiness$Function$GetWordCount (@$ma_vt2, ',')
  while @c &gt; 0 begin
    select @s = dbo.FastBusiness$Function$System$GetWordNum(@$ma_vt2, @c, ',')
    if exists (select 1 from @t where ma_vt = @s and ma_cd = @$ma_cd) set @c = @c - 1
    else begin
      insert into @t (stt_rec, ma_cd, ma_vt, ma_lo_trinh, loai_btp, ma_ccv, ma_cm) select @stt_rec, @$ma_cd, @s, @ma_lo_trinh, 0, @$ma_ccv, @$ma_cm
      set @c = @c - 1
    end
  end
  select @i = min(line_nbr) from @drt where ma_vt2 &lt;&gt; '' and line_nbr &gt; @i
end
delete ctrtvt where stt_rec = @stt_rec
insert into ctrtvt select * from @t

exec FastBusiness$App$Voucher$UpdateInquiryTable @@id, 'irt', 'phrt', 'ctrt', 'stt_rec', @stt_rec, @@operation, 'ma_lo_trinh'">

  <!ENTITY EditCheckTable "
if exists(select 1 from cs2$000000 where ma_lo_trinh = @ma_lo_trinh_old and status &lt;&gt; '*') begin
  select @stt_rec as stt_rec, @ma_lo_trinh as ma_lo_trinh into #editmaster
  if $drt.NewValue &lt;&gt; $drt.OldValue select * into #editdetail from @drt
  declare @changeField nvarchar(64), @changeFieldMsg nvarchar(4000)
  exec FastBusiness$Voucher$CheckFieldChange @stt_rec, @@id, '', '', @@language, @changeField out, @changeFieldMsg out, 'bang_tc in (''#editmaster'', ''#editdetail'')'
  if @changeFieldMsg &lt;&gt; '' begin
    select @changeField as field, @changeFieldMsg as message
    return
  end
end">

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.CRRoutingMaintenance;
  %Extender.Ignore;
]>

<dir table="phrt" code="stt_rec" order="ma_lo_trinh" id="SF3" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="quy trình sản xuất" e="Routing"></title>
  <partition table="phrt" prime="phrt" inquiry="irt" field="ma_lo_trinh" expression="''" default=""/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo_trinh" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Mã quy trình" e="Routing Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_lo_trinh" allowNulls="false">
      <header v="Tên quy trình" e="Routing Name"></header>
    </field>
    <field name="ten_lo_trinh2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>

    <field name="drt" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="283" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="CRRoutingMaintenanceDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    &ListField;
    &PostField;

    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="343" anchor="4">
      <item value="100, 30, 70, 553, 0, 0"/>
      <item value="110-11: [ma_lo_trinh].Label, [ma_lo_trinh], [cookie], [stt_rec]"/>
      <item value="1100--: [ten_lo_trinh].Label, [ten_lo_trinh]"/>
      <item value="1100--: [ten_lo_trinh2].Label, [ten_lo_trinh2]"/>
      <item value="1110--: [status].Label, [status], [status].Description"/>

      <item value="1: [drt]"/>

      &ListView;
      &PostView;

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &ListCategory;
        &PostCategory;

      </categories>
    </view>

  </views>

  <commands>

    &ListShowing;

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ioX2dlA71hiUG10e8IUM232bL0R53xmxxBG3dKiKlNtdMOfgaMJ4Rk+iTHZ7LkuMzxxsDpnEvZVnxZeaWQ1nxuQ==</Encrypted>]]>&CommandCheckVoucherHandleBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ia4XDMcx1FoIIq08b4bJZpbVjAXhuAeZ8AEa5tYn3akA=</Encrypted>]]>&CommandCheckVoucherHandleBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyaVpCbdGljJ0ivNhQve8w9M8kTybtH21DvisbTh6HRwUclnexkv4QDe/dFELBBlQew+Rmk2uiPOzNSGDDoLtUjuMxyi6tFNSbgyVpnopeL8bX2jmj7So3T1jDfzSqesx0r33G/VGdF3Dlr4gD0ZLg8=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3aN/7PxwrNmja2J0eINLzr7yQXqGj/Z9MadUpxjxPIGGvCZZbf9BoF7dav+kRY88dkP/omEk8QNHSdeelDXFkq/iBV0mY2wpIYWB2SKET13aWvAT6EtxHTuH+EitzMmm0PtH7l1uj6Qcnqvc0MUWVknUhqufFFiTrsKTPh1p2vl/o6mcCHnOmikaN+OBvXpXpn72QuoDsAWXjz3JABu3Dd1tlH3GDaRmt9STBvIT59ePb5+VKqDdHVZmAAcBIHlXwGOcspOFKhtmQMcl8nL5jzLU7bIkvVQcZDJB3S5MpsqAbVntTIBncEQEzrwCgn+Lfza2ZybjCeoNNgSp57vPrL55KR0OgihzKL3qguMu2SkGeVvTDxM1+k6zGDZXvobouWE30+inVNwUDL3X/cnK+5IZikMweaQ9FdgI2HJWlvCoNjKwSptpt4ukN6f9rNep1Mc8vt2P8VfOlTeQEqueWL/GaFMW0+xXX7Uu4RW4ll4NCeHDOy84m+qTHmQCYBONA+sJXc/CVZSObZ3+j2w7kgZWCrExWY+6JPOJferKBwS1I=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5+QRWddH3AlR+z9nDTz+7C4Odv1dOkJVQylnV9DR4+wjjWr1ytDDH0kjBn3xDeKl5FALVfzJeoirJBJQNhaoGq99a9+oOc+dO7kUut9EjtSXe2N8zZ3kjX1EBUq1MSLwjqhxaEd3XOB6mdseg3LQ/ZE8uSHGT97UrslaGP21zap/xHcnVBLmtizaAhPjaFXKo=</Encrypted>]]>&CommandGetIdentityNumber;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcABCz+CaAX0lpfMh9FbWFFjuVlYfG4F06mqTTp1YSsz/2TKj6b+Ry4VD7Kmz1pSNwptZXbttFP3/8pwGkNgE58DVovCY7uDc8PA07JZPvMqdHMDSPS5NTt2jH+TLKa2I/T4e0FKyZatOtUGRN3TCw7U3SB/RyF/9YM5qFxdLahvI</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        &UpdateWIP;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMQW7/hZnNhVZWACFGzUCpOsuyqw8YksF5cLR9BpK8sPvJIGC0t8CKcDZ0rPPI0vvg==</Encrypted>]]>
        &AfterUpdate;
        &ListDeclare;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0wwC+To+U3hJFkQDEkgMNaVxRVDarN56oMJe33BFsVNsn78i91f3K64WJT1iSYobUw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/TcTFWeg2CkdVgmIjSoMbRyerEZ31WRtm1y25nQj/TSNgbxctnJBcO2BbT1MgjsZR4BYrCNmfCzNnYk9Kn6kkqh7Qr/qNp+zL57WMBMcdQqeXcyvjgfq3/gvr03Z9tVHQ==</Encrypted>]]>&EditCheckTable;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLrKBwANU3goTpsQDfTdpB1DUWqBYxvj7gVhxyI+e+VxFZs5KvP4GanYgPSpFgG9C0/RcS8AatnS6VwvdhNNUJSQ3jAMjgzoMMvUWltYKD741ygpXcbWZID8f5F8OeXr/oPyKRvcFphgSEhEr5DGsuw20S0WlvOPqjqQMUe+nSRZG552YQeF83NBxWOqpWcB2gtR+h4J8Arxf4zbljc8iKZfNW3rA+ngq9qAYUcFsq8itrMTkW99+kGfk6YmoIP0NxO9jN2rt1YBodnwXEtXCmP5ilbh7z1Jia5Zqm8aSnSNE=</Encrypted>]]>
        &VoucherWhenBeforeUpdateLog;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QGp0gsSw/JWzAjN4USlIxivuzRu7UoXm+wyscIHbCXZIJfhCc3ENYWRmHWirspX17Y2KUSamACxskaV4ibKuCq165tD7gvCFLC56N686XfQnEa4ymlE7QZp4y6iNhEmIdrkmxlrMkTcdi0MsXV3QeDemRRi3dvdTmz2mG8Wx9Ba</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QGp0gsSw/JWzAjN4USlIxhfWLAkJYn99KNMveUMpN3a+teeBrAIx/qQsjP0zJjsYA==</Encrypted>]]>&UpdateWIP;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZKvZ0zV0xPSzTHWm/C7SeOo9gQ4lKVNofF9F5nJJeWmHuJzZfmCQg0btjiKPN+941RsZpGrjhDM8FtsRB013kCJ/Dmlsx/n8YUmFUz271Lh1aTGg3lH1uoRxLJxzS3o5rjpGbbvBKp+y4VYIFh3ca5Noks1F3ZV0MWzfSXM3YjTl0u02yYaLkS9VUqwFGFMoKvYV2BOhe9kD7v7MwC1N7I=</Encrypted>]]>
        &AfterUpdate;
        &ListDeclare;
        &ListCommand;
        &ListQuery;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu0hKEC8qFYFFXC6lCsCWHZJCGchB4NNLP7Sip0jqlLLgj/jCDW9Ds08WzKcLNjepDdeKwk7sC8RZSDuSp2UbSccy871VCGw+RCRWJI/PB/LyuuWbmO6WGsFLv8zuvc/ZF31IetusJUC6VhxBCeMHAFcW20asjsGJNFJm5cAoZDqUk45nyk3wLBYesIHszl4tcAKd2f6oQuujLkFcaym8XItpbj+WKZQVWStSBZWmk9hvOiMxFqGpdIZgYMjfuVs1RA3NHcTXNKMOpTBIIrgivFM=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        &ScriptIrregularGrid;
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EUGK2i9kreZBrTC72i9+vt9hw8vVUQYQVQ+1IodfU+z1K8v14OaMBSkF7Rb6pMdmBC+cEDfhBsB4wSZyhs+EPNuaxtQmP5oKdpeh3+1Frh+Fi9opwitOXJ644ZvWAFWqbdzVdpc2iznDVNct6ZrdNC3PzaV299a57aBA/FQE7yK5e5P3d1nJEBZc39S8fZZlrp7PAUoq3qcr9lpeyLtzXWIr3Kb+Z8p1AjsRF6+iYnIiuaxAN4fRfqA3Plc0/8jmppVFc2dE7ophx7d4GfiEVXT8UWkT3PuXYOUZ2fIO3n/CHixKhu9DnVcVzRRqwADfk7rrax5gcfE31WK2DuWjXpeYD3yAKXrF/ygHKT9RUpR7ygGb1YL62Bk5VzPnbLeCyP0+4K0Uv0I0O2jzaKopjiWCn2Sp9vAAUITGhWqjQXEHvbng/rU6af3GSCxlfIet7Rbou9nci1acVr4bjlOMxQxodNw9/pX9A61tdHrFQ3miN8jkyxkEF27Rs8btpDeHivXHZH2x4edKW/ObWRoCcW+XX6s0mG06+RwLQiM6OTEN1446KDPIpAhZ60IAGVABjBvCeU9pVtxUmAWOQiV8V4iJlvDqsBgJ9oBOo1HBveaEeub67ezE9LQfpvbsVTqPj/afFoiWAPj1rEXVsuW6ytRu9NzjFk69dKhKe4n/oNWTP8vbvJYNOHc1sLtvxST99dwKyOtxFqCQvjnfwcY9/9NtOF0TADSV4702jLhNBHa7AP0VRHoutK+Nx7IRboQmUBcfN3KhO83ptIDioD5XmnEgPgPF0Va0dDxsiLUHiz2dQUNhMejcqVHDi1CNXsOsu238lD9ohbE7jmXP/1uryc16zHbPfQDFiZg6hYlpsIXV/L5cBduPCti5n7mTU0xor0bChHLdrpk4a1/+q+nUpePTHeC2iIQMxFhbBBff3oUkym0G5P+S8IOLSnUGpNHqbUo3CwSpaES/v7HSA3rVnUXjx6xlrGNO04MM0Vit3qUsYNQl6b8vumznuoARcGGQK889vZoSf5OK1RY8kp81prbgpKac0ToZp28OM3W/cYAam+p4L/C/yW9t7TlrNXEYt23+Qr+HbGbSTVEl1PfhzNIOZlKBXAMBOsfvkjFsGMBAdH11+oBBcRU6tR+8scs7ayA5NlYKH2yhphlxX2BrgvdkkqkJtLGetMmfUUEBBzqS5TjCPaxDkvgIJevqeSoDvGWRFyZI+2NoyMrwvmhHqdjwBX0SfkbJ+F0t+9AyMojf5CHlwQ29uUeWKv/Ma3Fm/uWJE57b6bUCMfBsH3FUkRqXNuoZpa4coVgNZvHN3PH70doZvK3a/DF3Fs9aiu1jSzI3B6yJNWqzOMWUuOPGYPUhVNJy0qM2+qV2LvC6vxyPHgai44hk0nec5P8e0YZ4reDbb3PiUEXuC/hoDVbyr0xECGpRkWW4LNRhJgjuQgkasCnmN0dKOf33yx1fWMqnEgcWZOfzN6RyiTdlE1NqqxlV7jYABb70w8rFuN5Xi1ZoBo+5X+CLFHDrRa3d0GIQcyl48aEohoh8pAnhSx4nz7ovcHY07gNLzXGvdnkN7k2Z1LT8cMbvz9rDH75qs0dAmQ==</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyeZAU5b6lMFpjSQkscZvpqfe7LNR7NoDx2kmyW2x9eGixSzTG4jANF0WdMxHYAfCBivcGJAK4WSTTzQitdyLv9hz8kOBVtsS803nd/act9+Vi9sKBB6M4cyYkxL4xY1rcq3/gXG/T2cAOJE8AShO/z3vHp6t3Yc+c51asrSQkhy3w==</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVrKtUN2I68mS+YNu1kzGd1cJBEXG7+jAvci1Jt354JH328nsiAkCDvew5GL57DsilgQdnwR0A3vVad4q6bqAUrFDEo0XcyyPG8K3HvySRv9mcNfw3EbeHTVSv5SN2txA6+ag296u/FRJatJxlUBZXW68skXLaca6XBbNMKwStmZIphkMWiFZb/tUlp0Rbwux5WbntrL2v8YA9XurjrroYZy</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezA6W5nNQShumqPLVdtu9lNfoGbSVVCmL+lX0Z7Wo/WOps0CWTJMhFjEqlIbwUUJ0m6K4M58nl/tNt2itk2Rd8BG5GP03DtFe4bfO7i8Kc4cIi8LXmCrs+K7qopnM96l+plVySsC5tH3znxEniG0AOzeCGNDpU5GFJBeHOsFRYXtMn0a08aK3Ky6JH6l7CKVTI</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KkyM+BtQQNcZk7mdKL5G+412oWvhH4jvXuUVFXIhMRVJcdO26SRO7VINAssS3FPQ3XBpZf8AAse56PJYdv/Aqzw==</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyrbHcGKgLQlHwzG9OeaJurRpUxtRpsiU/VasauyUSukxv7UM+NaHYxA6YqfGHenQIqi16Q0VZYWzSCJ+XI13+rpAiNQR1AZe4G8kMjd2KC4W</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5VKcm/ftNpsgHVPiGXPUJs5QVFoBhdUYhWZ6oBKqXKkNOPj+XRkjWmLpIc5tfwV0BrFcfNpBKVvLF2XEBbLhfC89qysRQPxfeqF7596JfZChygxlw2uGb22+gctX5TEQH8I+ZumKM4vAu6LnY4YgxQF+vB+C9ZkkrevzOg7CMbalEmnjqv1yDgriB+jI94a5GXK4p5VGBpxjuVpR1AKlKlGb1aMWWkogrGfWFI0cgmNfH5CY9KXWehGPs6J37IBNu4l/jHqHFLGHpA7NW6G9VY=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZa8L384PUkg/4jpaczSTZ5aF4A/eQkAQqWsIx+wI7joA==</Encrypted>]]>
      &ScriptIrregular;
      &ListScript;
      &PostScript;
    </text>
  </script>

  <response>
    &ListTicket;
  </response>
</dir>