<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">

  <!ENTITY Declare "declare @p varchar(32), @l varchar(512), @i int, @c bit, @t varchar(3)
declare @pn_ref2 varchar(128), @pn_ref3 varchar(128), @stt_ref2 varchar(512), @stt_me varchar(512)">
  <!ENTITY CheckParentSubDepartment "select @l = @ma_pn + char(255), @i = 0, @c = 0, @p = ''
if @ma_pn &lt;&gt; @pn_me begin
  while @i &lt;= 16 begin
    if @i = 0 select @p = @pn_me
    select @p = rtrim(pn_me) from @@table where ma_pn = @p and ma_loai = @ma_loai
    if @p = '' begin
      select @c = 1; break
    end else begin
      if charindex(@p + char(255), @l) > 0 break
      else select @l = @l + @p + char(255)
    end
    select @i = @i + 1
  end
end
if @c = 0 begin
  select 'pn_me' as field, @$parentConflict as message
  return
end ">

  <!ENTITY c1 "if not exists(select 1 from @@table where pn_ref &lt;&gt; '') select @pn_ref = '001' else begin
select @pn_ref2 = rtrim(max(pn_ref) + 1) from @@table where len(pn_ref) = 3
select @pn_ref = replicate('0', 3 - len(@pn_ref2)) + @pn_ref2 end
select @stt_ref = replicate('0', 5 - len(@stt)) + rtrim(@stt) + '#' + @ma_pn + '#'
select @stt_ref2 = replicate('0', 5 - len(@$stt2)) + rtrim(@$stt2) + '#' + @ma_pn + '#'">

  <!ENTITY c2 "select @pn_ref2 = pn_ref from @@table where ma_pn = @pn_me and ma_loai = @ma_loai
select @pn_ref = rtrim(max(pn_ref)) from @@table where pn_ref like @pn_ref2 + '&#37;' and len(pn_ref) = len(@pn_ref2) + 3
select @t = rtrim(right(@pn_ref, 3) + 1)
select @pn_ref = left(@pn_ref, len(@pn_ref) - 3) + replicate('0', 3 - len(@t)) + @t
select @pn_ref = isnull(@pn_ref, rtrim(@pn_ref2) + '001')
select @stt_me = stt_ref from @@table where ma_pn = @pn_me and ma_loai = @ma_loai
select @stt_ref = @stt_me + replicate('0', 5 - len(@stt)) + rtrim(@stt) + '#' + @ma_pn + '#'">

  <!ENTITY c3 "if @pn_me = @$pn_me2 select @pn_ref2 = pn_ref from @@table where ma_pn = $ma_pn.OldValue and ma_loai = $ma_loai.OldValue
else begin select @pn_ref2 = pn_ref from @@table where ma_pn = @pn_me and ma_loai = @ma_loai
select @pn_ref = rtrim(max(pn_ref)) from @@table where pn_ref like @pn_ref2 + '&#37;' and len(pn_ref) = len(@pn_ref2) + 3
select @t = rtrim(right(@pn_ref, 3) + 1)
select @pn_ref = left(@pn_ref, len(@pn_ref) - 3) + replicate('0', 3 - len(@t)) + @t
select @pn_ref = isnull(@pn_ref, rtrim(@pn_ref2) + '001') end
select @stt_ref2 = stt_ref from @@table where ma_pn = $ma_pn.OldValue and ma_loai = $ma_loai.OldValue
select @stt_me = stt_ref from @@table where ma_pn = @pn_me and ma_loai = @ma_loai
select @stt_ref = @stt_me + replicate('0', 5 - len(@stt)) + rtrim(@stt) + '#' + @ma_pn + '#' end">

  <!ENTITY WhenDepartmentInserting "if @pn_me &lt;&gt; @$pn_me2 begin &Declare;&CheckParentSubDepartment;&c2; end else begin &c1; end">

  <!ENTITY WhenDepartmentUpdating "if @pn_me &lt;&gt; @$pn_me2 or @stt &lt;&gt; @$stt2 or @ma_pn &lt;&gt; $ma_pn.OldValue or @ma_loai &lt;&gt; $ma_loai.OldValue begin &Declare;
select @pn_ref3 = @pn_ref; if @pn_me = '' begin &c1; end else begin &CheckParentSubDepartment;&c3;

if ((@pn_me = '' or @$pn_me2 = '') and @pn_me &lt;&gt; @$pn_me2) select @c = 1 else select @c = 0
update @@table set stt_ref = case @c when 1 then @stt_ref else @stt_ref + right(stt_ref, len(stt_ref) - len(@stt_ref2)) end where pn_ref like @pn_ref3 + '&#37;'

if @pn_me &lt;&gt; @$pn_me2 begin
    update @@table set pn_ref = @pn_ref where pn_ref like @pn_ref3 + '&#37;'
  end
end">
]>

<dir table="hrpnbp" code="ma_loai, ma_pn" order="ma_loai, stt_ref, ma_pn" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phân nhóm bộ phận" e="Department Category"></title>
  <fields>
    <field name="ma_loai" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_pn" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã phân nhóm" e="Category"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_pn" allowNulls="false">
      <header v="Tên phân nhóm" e="Description"></header>
    </field>
    <field name="ten_pn2">
      <header v="Tên khác" e="Other Name"></header>
    </field>

    <field name="hrkbpnbp" external="true" clientDefault="0" defaultValue="0" rows="172" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="" e=""></label >
      <items style="Grid" controller="hrDeptCategoryDefinitionDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_pn, ma_pn" e="String: ma_pn, ma_pn"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: ma_loai, ma_loai" e="String: ma_loai, ma_loai"></text>
        </item>
      </items>
    </field>

    <field name="pn_me" clientDefault="Default" categoryIndex="9">
      <header v="Mã phân nhóm mẹ" e="Parent Category"></header>
      <items style="AutoComplete" controller="hrDepartmentCategory" reference="ten_pn_me%l" key="ma_loai = '{$%c[ma_loai]}' and status ='1'" check="ma_loai = '{$%c[ma_loai]}'" information="ma_pn$hrpnbp.ten_pn%l"/>
    </field>
    <field name="ten_pn_me%l" clientDefault="Default" readOnly="true" external="true" defaultValue="''" categoryIndex="9">
      <header v="" e=""></header>
    </field>

    <field name="stt" type="Decimal" dataFormatString="###0" defaultValue="0" categoryIndex="9">
      <header v="Stt sắp xếp" e="Ordinal Number"></header>
      <items style="Numeric"/>
    </field>
    <field name="ghi_chu" rows="2" categoryIndex="9">
      <header v="Ghi chú" e="Note"></header>
    </field>
    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="9">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"/>
      <items style="Mask"/>
    </field>

    <field name="pn_ref" hidden="true" disabled="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="stt_ref" hidden="true" disabled="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="stt2" external="true" hidden="true" defaultValue="''" filterSource="Ignore" allowContain="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="pn_me2" external="true" hidden="true" defaultValue="''" filterSource="Ignore" allowContain="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ten%l" external="true" hidden="true" defaultValue="''" filterSource="Ignore" categoryIndex="9">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="232" anchor="4">
      <item value="120, 30, 70, 330, 0, 0"/>
      <item value="110-11: [ma_pn].Label, [ma_pn], [pn_ref], [ma_loai]"/>
      <item value="1100-1: [ten_pn].Label, [ten_pn], [stt_ref]"/>
      <item value="1100-1: [ten_pn2].Label, [ten_pn2], [ten%l]"/>
      <item value="1: [hrkbpnbp]"/>
      <item value="1101-1: [pn_me].Label, [pn_me], [ten_pn_me%l], [pn_me2]"/>
      <item value="110--1: [stt].Label, [stt], [stt2]"/>
      <item value="1100: [ghi_chu].Label, [ghi_chu]"/>
      <item value="1110: [status].Label, [status], [status].Description"/>

      <categories>
        <category index="1" columns="566" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="9" columns="120, 30, 70, 330, 0" anchor="4">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5T1sKbKaC1MorQ0VByewPmdYkzLH7MWLXIozqyovcwp14slW1DH44eV8s4n+ZXV+AKjYqHjQeo3/cv2XYzZbg4Gg43B+owq6oInFGdIVXsl</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5T1sKbKaC1MorQ0VByewPmdYkzLH7MWLXIozqyovcwpZbXnWu7PBJA2ZZ1gOUYtQTmgcrO+ZazA1QXdFdUSWOk=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYaH5qMro2OapIgtmfU4naa7tw9BdIGyCn8i+358ZB1gIBH4LhXmkbib96j339Yq4dY=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6Zkd1IfNbjDWqOpM8XezsdAy3tm9DcMMTRZAeJi75XkOKRqBJCesixtTaZ3l9fye65ddm8gLtVTu2DWj6qcCfAPs2Z1uKY7xsvFKj3t7UH8+xOshbsi19XTnbFRcISeJfOGjWus5bFVhJExjQWXKHyT2o+utWTQiwBfnMpc1tUY4</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbQ7sYG20WqZnTfSDT3w6ZuXlgmtgWqzx/STyWKBrTsNEtt9bfWy8IW1eEF3LRlbxEfKKokKt+buHN0hyWtXmh5DTVjgUt6fZGC7D5v7aqen0M9qfJnDv7EiZDdfQG74ndSlkx3kNwySFT5VECFaa89ootF3MGHn6MaDzq1knjKWMOSOu1MbC/N3e981IWZy8r+FvnjPg3fhhjDJhDe81POcKoP5apw8Koqa7GWJlpzX55Ln8JbvirP53qmIvc7QCw/JfDNXAi1ajzFCkItkSulT1G8XJpgQJmrwsRbgw5qruXKviPavSiyJBbmJ22qzLVF0dwUXM+N2Dkd6l9Hes7DD+qxskl5dbQD5fJdEpn3mYyR907UQHpVpbA3+8VlLmckPgJpQ5481R3j767Tb5k2en5gax5DLQZ6PwfRFNqxXU6bT1eCwBQx9GEWik3L+JwF7yo2y4J+cS+msUPAGs66wKJSm/V6dAq9u4+ngwST7Jk9tr2EUE8ktC8R/NE6qVPGqWm/R1IMjxcK4rjp037wfDzFQdIzZyo0I8cpy7N0oYbDRbLUNwNE0Omlr7ILp0MOYXAP19/Xuc0WF2LD8/kuWFuk/trMHGKJCIt+PvCS0T4aqzEG2ZV+68QsuS6QxrxW7BF2xQJLgVj2y+Za0zZj9fUTppLVnFshN8hjAczHgtExWHPWZvSt+qHwlVoGnqag=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nIwB+ny/fuPGR8o8tX1sDWLN2pC3pOLXWXZC2ZfZhJNwsX2L8it5SvyINkp1RC0wT3uKccdIHpYx8bqPnau2KuaOqy8XlH8hjOKQBznxEfCnAi6NmVe+92zFpMWOfEZWq9xGW11TjVVvxTgY99wcogoVZpjnGIUC3KD4Pv/EDl4gfZEIpNnZYzEM7+50rRTjvxPb4+T1mEytFqQl3UWLr64ydctWnrXjxb/yBcgFtdYM=</encrypted>]]>&WhenDepartmentInserting;<![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70N1+X+FnJzMIhqOZvFfq46OATrsPr/+uOKjDIqyonjiSjW1hHoBk/aIkmuT3R0sEsbt9mXkj6vO7iyT/pmEcXhE=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6fzdqJ31BOUwTCDbJ/X2oljAoOsPivbsdhE0yqP9Vp135VO1gfVOneVQVz2jqCqHlOj/gaeyF/BmlXSqzJ3Bft2EIwPbi4eGhscO0pZ+siG1W/Xr5HVxdi+M4PI1316ru6lb36L4DE665wEypCog2ezqfPtVKhWXi8ObkR3z5LVHc09MuhVN7YBCs66FQFiuvictR5bmBP/tb7VLei4zsBRuJLMiZo34lutkApqqw3Yx</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jRDvX4B0shW31dEpDHx+5dQTyj0AHtUlpgPkiMHjr22SjO2zK7WeJVsK+Z0hz4vHJX+ttHa0vwsj550hxIf8wjuZRijOis2YW5i6q7iK+EzBOT7tmtYhwhBauExQaSLG9fPL6FrUp5GZlkhNuHiIKe0sXZSORJU2XwHXIItFcv2djpUOdMFxvqBxTRQYqp3Ib+79eWlLDDjqIdopLhT6Kb2IOpCMHdxQUgu092NOyMTBf3du5a1uJSP91XoxxXo8WD7ox0otTr4LDHGtydAlm+PJmW49SrZm7uWcnaMLjjm40UW7Lax80RoaDmSOO6zprYPhyYCaJm4syrGAaDKZ4k9mAVBMfVWXQbfSlNzKf1muoDTvNXHCjbm/hcj9QM5cEXQpKhk6mPndQRBz3PpYNSVT1EOmgdLXjC7HpNB1ZmIoQ2iQwnKwytSiXCikQY3dV</encrypted>]]>
        &WhenDepartmentUpdating;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+iljEYSbW7tQ8WgKwNneOzvrVeXQ77K4zpnSqd5pvyMm/jVi34IEAmF8PzlQnSkY0lw1lUJvQtB0ak7zn4FdmofkC0mG4AYfEGHD8hV2br3IOmQM3lyPOhIOQGFxhRcU0hc9EJNxcV1QKJWXp3d96t5GsbQ217HiArEqepij1fyV/2XUubK4xVcxyOLjKiGZA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7oisd4TzMGbXY7yuqtX+heGCr/eQWCKrOTXkhJsHeS4fGeAHDhwTzOpz5CxSbZCeTro3Ssu+KHX7v8UiD/3BN6rNEoHGRUK8tUUyDVkG4S/N2Dhifn8NofHRh4Ndl0g17aFQiOeOzfVZD9Ps7WF36vnrEU4oLVFAQrxyF/HJIzaIJk2pd/6W9ViU4RHSk96lfHYOm2tCRzVnJtgDR4G1HS0A146xectPFDlL6FfAAJtjdkvZUkAPwxJ7VgiLOlehfHl0K94BpBvfeQiz0/WTcOY/KsoMgfKFU01lpiIVkA94CQ==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3c/FMazMd0tNlOABei9STZVYVG4n9V0nzqbvH6gxzSonOm55jnQMm8D1DapzeJep9M4E1r3Hx3GXPgQDalKByfMi5BxZE/v/4huq4EzEP2eMxc5n69q799ER51bb4T/hm5w+arTpA2/45Pt6CdaZ7QcA==</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6fj1RdgWM52ZXJkWA6E5kR9Ey6nsdW5F4axmFzc/b7xSl4Eux9T62bF3DE80uzd3CVGYw0Gyta+qlTLvD2f7kDM=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KYre/2qZP9iK9brh9Pge6RKkvMgTqIw91Fjq6gducHx5HYtI5zFG3edpIjsGgL2NJPO1BpGNyHdcfg5l7xcPDSqjHCb+0NWyV1v1yHVK/Jy4I95vEHvvl2G1nxfhP72sqQAgmHFRciSc00hq81mtVqWlnn+DMtXzrkfdoGnBMutTnpc7Ez8MQ82x37UjTwTuYi2KHryaQ97odJZfQM0qdeptAwCyVnPWNdBWP+0kdf+rMst7N7aaLNXIbh3tBcb1ll0HzixQGNjq1w4AflP3hOmJuYOlw72cwyWvvED2497B834hETeRRboiBvjIEnUbd/dy3OzRDTyYwTQbmMZbTO/d9VvCquzy7P1SpKUHSxHp+6asj0xI+koazjQxfDZzbKvQMcYrKbSuzqokCzhlvyqS0XbPbn2ARF9KlM5OjS8kHRftOdFm7Jv/jZenxigVwTOrC9kNgIIpVVe/hbQoHDSzHkIvi2/wkIa4mdC4t8wqImPjGL+Zt3UBY+8nPzHsdjf6VQo94S/1kmisaMrIbsuth1EER4wuFkhPoH5aj5TokyQ9SI12eWKPAgSXpmSxmNYGgn+NR2r2Ps35W2zfKJxJz/sRtVl3EMVqAtlYkYFWKEbmaqGAUFV0HConW8+/vb8Tkm3rVwKG5chJ3yoLGsOmpg7EaFsh8rgZfP51Lj29Cck8J4b1IiceD4QDnPlvQ==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkYOE824Gyc+WNFAywecVQj06s6ri781YFUa3iwRgudnp8kz0ijUb8GUoiTIdRqvFr5uy5MNVXh57y/u9832qiQaWVRmTkplHD3b3IXJqJWWuUUb4INKqJPrQ34/YFZgz+nkYK7/v9+EA44nZl7Ipsi8+W8WSVEgD6UoWV3/uWhTIzMee4lNsxEaJXCOkSMe1rsqoEjFrFh5eNqquSBx/6BB5buVzPCRuf7CUF5KwxqOo2pNcHBk0c42DItC47hdfD6bg1GZ256DFBCYwtGS2kYlv1hcY0ZbAP+2FBKHx3Snu9ok80UixRA85pUwK/C11FMPTIQoUqfguEqRH1UH5o6orS/gL6rVUdqLeEZ+l8eZcdAzuoqi0jnR84LI32H1nrDMse/JtpCjvlJRM55GGOtcMpsS9mhkirGA1f/6jwjQbPXGGb1v+wMHpyQKHP4obVAS3uRxRVzT1aV0fFEbiHgw7FgPySiGOqO46SM0kXBV8F5KilSCtK0rr5tLyfaQ6d1yBcZDnu7pMixXLqxM3RyylBzl9ffNCjg/G7x2aXmBcpRmS2a9RYAU+VLL5qtu0moplgNbjHscLyN3S6j1QQU3</encrypted>]]>
      &ScriptQueryData;
      &ScriptIrregular;
    </text>
  </script>

</dir>