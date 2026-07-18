<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY WhenBalanceBeforeEdit "
if @@view = 0 begin
  declare @$checkVoucherUnit varchar(32), @$site varchar(32), @$lockedDate nvarchar(512)
  if @@action = 'Edit' begin
    select @$site = ma_kho from @@table where nam = @nam and stt_rec_nt = @stt_rec_nt and stt_rec0 = @stt_rec0
    select @$checkVoucherUnit = ma_dvcs from dmkho where ma_kho = @$site
    if @@admin &lt;&gt; 1 begin
      if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @$checkVoucherUnit and r_edit = 1) begin
        select @message as script, '$NotAuthorized' as message
        return
      end
    end
    select @$lockedDate = case when @@language = 'v' then N'Đã khóa số liệu, kiểm tra lại ngày khóa sổ.' else N'Data is locked, you must modify system locked date.' end
    if exists(select 1 from dmdvcsks where ma_dvcs = @$checkVoucherUnit and year(ngay_ks) >= (select nam_bd from dmstt)) begin
      select @message as script, @$lockedDate as message
      return
    end
  end
end">
  <!ENTITY SiteKey " and (not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID))">
]>

<dir table="cdntxt" code="nam, stt_rec_nt, stt_rec0" order="nam, stt_rec_nt, stt_rec0" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chi tiết tồn kho nhập trước xuất trước" e="FIFO Stock Opening Balance"></title>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" readOnly="true" hidden="true" allowSorting="true" allowFilter="true" allowNulls="false" dataFormatString="####">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="stt_rec_nt" isPrimaryKey="true" hidden ="true" readOnly="true" allowNulls ="false">
      <header v="" e=""></header>
    </field>
    <field name="stt_rec0" isPrimaryKey="true" hidden ="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ngay_ct"  type="DateTime" dataFormatString="@datetimeFormat" allowSorting="true" allowFilter="true" allowNulls ="false">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>
    <field name="so_ct" allowSorting="true" allowFilter="true" align ="right" allowNulls ="false" dataFormatString="@upperCaseFormat">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>

    <field name="ma_vt" allowNulls ="false">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="gia_ton = 3 and status = '1'" check="gia_ton = 3" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZYrBN+8y/coU/Wwpt8Gu7F0/6je//P29XBx9NhVoDEw+YA2L7/I2Xbsi2PN/h1SdXg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho" allowNulls ="false">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="ma_dvcs = @@unit and status = '1'&SiteKey;" check="ma_dvcs = @@unit&SiteKey;" information="ma_kho$dmkho.ten_kho%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZYrBN+8y/coU/Wwpt8Gu7F0v68+51hJsNwFrfSMtO1AkK/5zj8OKGVPasKS81WALUg==</encrypted>]]></clientScript>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vi_tri" filterSource="Optional">
      <header v="Mã vị trí" e="Location"></header>
      <items style="AutoComplete" controller="Location" reference="ten_vi_tri%l" key="ma_kho = '{$%c[ma_kho]}' and status = '1'" check="ma_kho = '{$%c[ma_kho]}'" information="ma_vi_tri$dmvitri.ten_vi_tri%l"/>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo" filterSource="Optional">
      <header v="Mã lô" e="Lot"></header>
      <items style="AutoComplete" controller="Lot" reference="ten_lo%l" key="ma_vt = '{$%c[ma_vt]}' and status = '1'" check="ma_vt = '{$%c[ma_vt]}'" information="ma_lo$dmlo.ten_lo%l"/>
    </field>
    <field name="ten_lo%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="so_luong" type="Decimal" dataFormatString="@quantityInputFormat" align="right" allowNulls ="false">
      <header v="Tồn đầu " e="Opening Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right">
      <header v="Dư đầu" e="Opening Balance"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" align="right">
      <header v="Dư đầu ngoại tệ" e="FC Opening Balance"></header>
      <items style="Numeric"/>
    </field>
    <field name="dv_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="lo_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" external="true" defaultValue="cast(0 as bit)" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 330, 0"/>
      <item value="111: [ngay_ct].Label, [ngay_ct], [lo_yn]"/>
      <item value="111: [so_ct].Label, [so_ct], [vi_tri_yn]"/>
      <item value="111: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="111: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="111: [ma_vi_tri].Label, [ma_vi_tri], [ten_vi_tri%l]"/>
      <item value="111: [ma_lo].Label, [ma_lo], [ten_lo%l]"/>
      <item value="111: [so_luong].Label, [so_luong], [nam]"/>
      <item value="111: [tien].Label, [tien], [stt_rec0]"/>
      <item value="1111: [tien_nt].Label, [tien_nt], [stt_rec_nt], [dv_yn]"/>
    </view>

    <view id="Form">
      <item value="120, 100, 330, 0, 0"/>
      <item value="111: [ngay_ct].Label, [ngay_ct], [lo_yn]"/>
      <item value="111: [so_ct].Label, [so_ct], [vi_tri_yn]"/>
      <item value="111: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11111: [ma_kho].Label, [ma_kho], [ten_kho%l], [ma_vi_tri], [ten_vi_tri%l]"/>
      <item value="11111: [so_luong].Label, [so_luong], [nam], [ma_lo], [ten_lo%l]"/>
      <item value="111: [tien].Label, [tien], [stt_rec0]"/>
      <item value="1111: [tien_nt].Label, [tien_nt], [stt_rec_nt], [dv_yn]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7t06LeFFPkx0v2pgOE59vqlMHqTIA+GWHnpiKPehH7VUxxmyM77SrJp5aIqv2vcgcmELynMNq3wr3AsqEfTK7Q=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHY1X8UtDmCQxRKhh6aOFgFa3q8t4B29WBmoXEwhwbrorq85dMEUc4bpMtnUsVtRy/4PaQa4WdLJbu465SienBIMooyD0L+DA9rH+kDpafj1WNYLYi2ny0otxoptFU8zVeLXolcZokkT0h6Nn7sbvDJ1Rqb7shfFJ78YBmvh6fHDyg==</encrypted>]]>&WhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb1W+i4Yu2FYMddmulhaGEZweWNTPVBc9T9b57+xGNYOZBxbQu5w5Vt7mjkfA1NB2gft4D4FQxXRZXtuRtx27+c</encrypted>]]>&WhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzaAVAljzWNpJ0WTf2zklqZzH3jJ83WteQg0XfS12JbsUsC1dq3nUn6lHwjgC9uAHzHQ3TGQIVIZ9N3/8I7mS1V1/9+84nP/1WARr8i345FM</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VHNwvnNAfVlIkd7C4wD6rzayCZP2fWoZLtsU7wYSzHcuZtuTjZqs13L2DGosuErcvgWue7tGYIri5F+CDU2Z//LEZ2PnxoNU1iprcF8Pv5U052FkkrO7vN5mVC/FzzZsZDXOz5p+fLZjMnosI4rR0YjvFLDRHx8O5mJewZ75cH7qrCh3WTQr7BbbeGaC4dD3t4B03dCQlvQ+pJbdSfZnRqEw3azpcoT1GELPfLiQZmaexof9X0Ao4T8IOjTVsfkiL0HxNebJgcSACZLU1oFb2ln/CiZwQKsW2qkoRBeDQpDPRno1gB0zpV7ITa1+qAONNfZBo+hHFM5eFwK6kOa6K36ctXYgySonht1fjiTWJ6H</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6WT9GXwoTXJCpEUIVFjMdumVqUOL6f4OlHIYIaGkgzjfkEWWAJIiemVRNm4lOm1WmSHY0OuxI+INwLRWpebw1rxqjE+YECKlz26dhFTa/zas3/AqIdqZGg0la2oXARgUAoOl1iwJFNCTbiJIr+06+ulT8WVz0LyF3GUNwJtas1kyeLjutMRapq0QuEkz1VxdhB3floN0SB7C1VcZcvA+aqlBDVc6uBtLJDXI8OzNuJ6qfQRkmnallwbNPqzhHZILVlm2B8LfAiguNeQaq9/icQaVfICv5x8M1PjgqtjLmkH57piSP09iFCQBCLxEkkqOixKhX8LOanOOssFEoQy6ANqIrnZB2VephWv69RiyaT1u</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KmRo54ol5vOnEpdrVadgaudPllJrIQFKbo2h8Tf8LMeFawB7OP2smDDoCBiNCRyFzhELgWRjs4oi3QXJKxbASNg+bx+vTZml8YI/L9BgSF9au901Gbdg68Zt6233AvcoKkY7niilpYxRWLv98drP7OGO1dJbzRbfBp6zT/Wf509D0AB/OML24m4dCraQa0dYYlqlSiKvE6i9yehDG2KO3Wg/tJIc0JgsEWPOJAz22vY/</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6YieXs/EwBW1oZwEx6bkE1dD8dOc3FgiaTqEz6b7eSDorcKVJWO7xxLBTjHI8FpxJ5jdYIgzQ6A96nF/j9Vsc3Gd1kbHEBjkVdxxJBv+qihH1tSOoGWaimH6saWBCsd83LKuiQQ2YLK3373njc4e9kHnfP8GxgBsJNHxYncZ5ZRf6BrcEk5RVcNUCh0pea9lqXEoT3uIuHKAK4D2tt15ImUqUuLXQbfp/plJEqmS7kO160ZhhtGqQjnVdYSdbcOWNg==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeifCRlnmuX3C5qSLhjIsQr5Zhubly9UpZf42KfeFTJyw0Ypgcu5PltGb1BI7MptYlQ9/qdltheV59j7rh5sf3QZbmjYcI2DFwB1mLLFAzoY6G6559N92jBxCn0Nx6JR1K66c6HQMew+SdJTcEbyP8c9xbxepNFLWCZgAuCP2OL6po2+IllwoaDxcsdy9YB0PNTX9TQltLaoJSUp6r4Yw1tvOtX2Qw6fc9uJgVAAHI2EDygJC1/SIfjEunIqEdh7LUi9c4+v6Uh5ZBSA3tDJHzjihww6Frz791+KwygD8vbOv5uun0yK3n+ECNry8b9+LdklpKzDdtt8Q0986ThyYwnk=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6YieXs/EwBW1oZwEx6bkE1fCMlOP7hCWJ3chmbA+gW5HhoCGhVKFdbCDjYcm9f4lzb7jLiq8JxlY1nPe8Z52nzI3k1Yi+IhCGTndkOd65CAgKaJ53hCuXZjPYgJtkaymljcC3gCMWQZZwNBnkeSNxU7Bs+z8bmHagqv5/fefJRbvsIeypGM+TeKgloqdlzmBO0hNMnSX0yFjVMYeI4Yw7L5oJPt+Mgm9s4XmnfZIUTOptywDM5BRuSTcLwYUObBC2tq7SGvt3wUrnjlJjPxiK8mfVFxOgot7RWUim3gGKD1o3ubSA96gFUAeOQUvo1mCFrZ2/eW+AnoY6AsQ7xKfkClEr6J4MiTjFJ2uvDr4d+O3dQ7X9Vgn0L5RMc1T7m+V2DQgNCPuXNBjqPNnWIkNaWdV6/9FaDnPCuRc5Q1mn8VdQjIWmJ68lp4K8wrkPOiTHCx83nVoenFb/G+n32OQT4VkN3rMMAfR1+QlY/2b1PU+6irtwrKlk6ig0DNq+fyi+DISS+j27XoAwtCrJijMbk4i3dBeN/8MDlD3aBxAus5S42PMdYXm7B57Wu60vs6TC5Q9Ei2hb2KRoiEx2HMDD4jg22Ft+791GgO6UahKhby0XEfZP3iJfjqsyqF3mEN04SSmD+FyFkmnL1go/wcNAxFzm3wd74HgyhexZNDZFnudHVoSFFAW0UpcxrgrylcE5k3dgkR4KdKvBvclQtifgMo=</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KmRo54ol5vOnEpdrVadgaudPllJrIQFKbo2h8Tf8LMeFNa4tx9cjf5wKXLG7kklvBy3IE0GYbokB7lztmz7N6VSA58DVJyALMw0mV2Tg28dP</encrypted>]]>
      </text>
    </command>

  </commands>


  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FU+vVRD9MAiT40fyPJ1UwGdim7Q8gl1GwVC4I8h3cEHPmcPjd/wy/0rsPnyCO0h+GkYJAHNl0D0L7BDw9ngMDLA+tkeRNhpF75vR3BortSiAe4caZI9AapOpSjM7IHy0/F/Xd2jLftflRqw+C2exSqt31+dHzL3q1zzD2G2swl0SFVbZzwg92TFymDe75FaweDlqXa2bjKqgmau7LlCE7K/fcVqaS/OOhy7xvZPyZalKH1HIpyb3mfzFFvqy3486cOuOQOV5lHJQcTq3+ldn615tEw/RB2dtjO9x+zwSDD88KPPgcbHuldPebRhTKWdLOcQs9cPyrj10xqCyWJASOBWqoJDbsG242KSGJ3/zQr8vb6EzIizkAIMQmDdjc8tGv9Iw3mMv8GUQ/i0hfRNKIsF4YW8WzLWV73WhbyBVAPGz2YJzQZAHYHC3tHvyxli7KOBTkRNK6NuirGHuk1jToCxbPjFeZM4HCgufrQ7jAJDCFSZV+KcBxwSXIQLG5URQNss9h57iEb6JcRSGhFGV/d6hw1eTUJf0P0H+Wks2kdrgGmYR9h46p+MhIGXaZ4FmBWxp85uciJnM6aW9s3AjJIRJ4JHSinMXZKwohmWwvNp2l5M1LCGsKMofFg9DxxN844ty9PfTwZTb7AlnYNibtGZnJR3GSNC65tWfecJPpIjUyTgYfMvfY/ztw/AKr/VfxJx8ZJFllm/Hsk8N1fIXPMRzNlZG4vTLPbv3zjnUKitZ6WwyVWUKBfq64w3WKy/LJehCruuGZGs1bxYOrBA54Yvi5b2LLWFvS77sCc4IPIzm6bBSUzvFwXtHQQ++p4bTYfouDsq+Zj8XMsJfNFOwF21ayiL4YWRsJWUK6zJXU+/plQqsXIhhV9CWCvqm2A0nBFdXPMaqW1UtDZ6iskws3Gjgvl2XC/OwmGihMMbWtUr</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Item">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6+INkQWNmjEwlPl+HrVfmFbZmcLoLaTcoJ3VP26WNLB68m7x11wTUK0vt9E6NU9xanuLREK6qTjyLhO9H20+4f</encrypted>]]>
      </text>
    </action>

    <action id="Site">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwiJFTp716WGUT+dOSl6JLyhU2V5kcjVLfYU47Q4Zfk3sImhBOotbX7TJiMbrAdYbmNJPHACWnlZCqwzchNJiub+b+gnU1ChJ2sm1+OjNtzUb9rSD/gZdrxka+SvfuG+HD9QTyE0+BwIAyFs57lG8Vw=</encrypted>]]>
      </text>
    </action>

  </response>

</dir>