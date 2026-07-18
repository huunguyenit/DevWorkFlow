<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.hrEmployeeCardInfoInput;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="hrnv" code="stt_rec" order="stt_rec" id="H02" type="Voucher" xmlns="urn:schemas-fast-com:data-dir">
  <title v="thông tin chấm công nhân viên" e="Employee Card Info Input"></title>
  <partition table="hrnv" prime="hrnv" field="stt_rec" expression="''" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" allowNulls="false" dataFormatString="@upperCaseFormat" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Mask"/>
    </field>
    <field name="status" clientDefault="1"  hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_nv">
      <header v="Mã nhân viên" e="Employee ID"></header>
    </field>
    <field name="ho_nv" readOnly="true">
      <header v="Họ nhân viên" e="Last Name"></header>
    </field>
    <field name="ten_nv" readOnly="true">
      <header v="Tên nhân viên" e="First Name"></header>
      <footer v="Họ và tên" e="Employee Name"></footer>
    </field>
    <field name="ho_ten" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="bo_phan">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hrDepartment" reference="ten_bp%l" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri">
      <header v="Vị trí công việc" e="Position"></header>
      <items style="AutoComplete" controller="hrPosition" reference="ten_vtr%l" information="ma_vtr$hrvt.ten_vtr%l" new="Default"/>
    </field>
    <field name="ten_vtr%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="bac_quan_ly">
      <header v="Bậc quản lý" e="Job Grade"></header>
      <items style="AutoComplete" controller="hrManagerLevel" reference="ten_bac_ql%l" information="ma_bac$hrdmbql.ten_bac%l" new="Default">
      </items>
    </field>
    <field name="ten_bac_ql%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="hrttchamcong" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="282" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="hrEmployeeCardInfoInputDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="stt" external="true" defaultValue="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_gt" external="true" defaultValue="''" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_sinh" type="DateTime" dataFormatString="@datetimeFormat" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_ttnv%l" external="true" defaultValue="''" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>

    &ListField;
    &PostField;
  </fields>

  <views>
    <view id="Dir" height="343" anchor="7" split="7">
      <item value="100, 50, 20, 30, 130, 100, 323, 0, 0, 0, 0, 0, 0"/>
      <item value="110010011111: [ma_nv].Label, [ma_nv], [ho_ten], [cookie], [stt], [ten_gt], [ngay_sinh], [ten_ttnv%l]"/>
      <item value="1100100: [bo_phan].Label, [bo_phan], [ten_bp%l]"/>
      <item value="1100100: [vi_tri].Label, [vi_tri], [ten_vtr%l]"/>
      <item value="1100100-1111: [bac_quan_ly].Label, [bac_quan_ly], [ten_bac_ql%l], [ho_nv], [ten_nv], [status], [stt_rec]"/>

      <item value="1: [hrttchamcong]"/>

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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFYdV26gZh3fuc8sMEXOcRApojsGPtO3EtbhsfGaZQW8HLMATaFE/3WJ6Q96KgnnQhtyVdsribGM66gjgb4Lq8tv1rsPxcAYHEgF5hzjomTR</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAnfmKSAJtKy5hx6O7sHsw4lKJEGGIkTXFR7HLnY0Wlh3I1ZS4GhdYu5+9FA7s0l1kerdvDilMGT20deAsTYngILBLwO0AUySUhS6SGdGOnI</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5wYSL54cQwpc6EiB1XHUdIkhz7RjSATML0QuNwEOkBZSs7OJz3MkSg3znwtER4k0YIhbEarCtOgRfC+UtnxHJG/OOWMJOj5HJf6ykkjsDsJ8WStdCaZNTVmO66iU3BhHSHcp/7pnKSXKvuGPGCxyQZl7X7O1XSGwmapoiPqlK9r0Erq2PWVM2KRQcmKU53rFwPulipWHUGTOr7J7A+AwmJxxDXC1KjbNrTO9XATRVoT</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &VoucherWhenBeforeUpdateLog;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPx2zLPl578AfBFmRnX9kG/Gc684wxsAtzm0rLHN2zGjplfnywzl9C3t3PmgRqC75LKuahlSVIFRv3yhscTZR0JI/mwU0Oa/26HL76y8NMvOOCMcnmvzVnNAs0T3ZJxJ1O3b3mm/VUzf1QoRNuERWgGU1jcELGZrYppIljF7JLF3</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RqAuJC95KuO7IeYpxBWu3rIgaUG8/LJL6Houy/xYRbh2bcw1ViA9gUtjP60gBFyGskHBBHNgGvwT6bSrDO7u5s=</Encrypted>]]>
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &ListQuery;
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKzg1CnqAqiGaVcLrReGHQaYwAp89KifJ6Dg3iX9FUg/3q6dqmuvBeqiAHz11GFPcVU3rGobrTpauq5iSXOovNHd0qGy/UK3fwG3rixrGP4apX0cMhYYjOFQJ0esCAqkX+Znn+AdT4ymhH347EbiSn0oDqZeOK5VzKaHOAF25YAPJ5YXtqhokQWeshWLlyVwUSVRkOTjUizFxL88g1vXwZcGj+3/vM/IsYl1wsQj0gxjnRG0pL5SV9iNt2TVXknBznGrStf3537R4SUZjfcicrNRfwZAQJ5fzmarBLl86ntqDzq3y+MDk5ZprfugbEQYgTYUn5fIMZqbmNhq3GO23ysC6QlRMJa3pXC0r0+vPDIHFwhyk223rKpAbr07loXzxz6w29O44LVFRPR0zE5AN6yqLN1DZyux18rNq+iC9yKgggdkq1nfsMs6ctLIlE1myX5JUsdIDhWDP46acCvJgkGOXB/GVjlx0iIC3u+55Q7SkBh6/oATnX2HOgYRE4Bx1LvgKLrnkOfAGSGBaHJ3OJ88IVsRVAS0o/sru+m7vzjfpakWFQpwGJvHr30yzQUB5apVHALnrCh29vhPi7c4Yk8Esv8u1/29XB23MHEi/OvfaGEyhA3Cfj49EBHVKQEv64FZBLhGifrO/m9PniEMQacj3ipDYHOOfA+MczsSCScD725w+OPULoa/SEtcEntoJfdZXnCGl3Pl1TBSiZCc9KBATEzirFuEGmvxMlHPGHYIBWFp/Aob5JzVF70NAIVddsQLX0hUwxeWHeeNlTPT4XtLs7xOxz3Hz2vhx1qWCBlaQw==</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22bqI0/PrJCU/a+ee3Ue8mIiwNyDgsWM9Qsmx6OyS7JJZJoeHwUlKLm2rcWIV+1ABce51g8QoTh+Usy9aRqzJEzhlryBrmN9eMFbYjak1q1+deYQX0ep/E9RkR9LPj9zp1ZHDIMrH8Wk/GwsMo0Zooq3psrP79KlElqGkzqud0FjY3LJE/DZzK+FxXLTquH6ih9ue4sv6pxyp+aT+hODWxP8=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVqq3ZRP+04iKNuH36giPDuv5NAyqClKmm66dokwYBfG8Y/AhHiEhObDhxE9DflSq2Pec3HxXCTVDbtISXIyrVciAt5w5R3x4hjNEorvV5+MSrEEgM3FKMHXRJd/W3Or8l8o9CPRy+b1+rdmTHOo+nL/HHv9vBlX8N5osOfrk01QagpG+MBpjQEknpoa7Ich5IdMAKvQEXK32m3GYSsCQzt6oBfXfBgG4GCm5tofU2W3ug==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dtiPpBW2Z7PVz/x914B3x03Hh+i4YGlGOpY9AHwKWklUUq/HbMTN6NbuE15BWv4m1kMOjVkht00g5IG6ZmQ8w5FB17OIcGcwBhifq2IL1y+fzfW8nw+PsDnQL07UwYkNXM9g/5Qy11O6voFFwPa/8mEZuUO3+Nlm48YYlQAEcFhTNDF5zzwW7Zfi3IUg8QpJ189ipcBSzaNRHUp2t6h3qCsqiNbIo+DXzYcu1i7B/tZWGfASyFVYtqK0w0tdBdv6GbUHrpdfaphSzyqk0gCK5bPigQkF2IdnjHmm0wXeNuPI4wZSTdI/gVBOLP/Pszvhw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8K1RVCY4SdjgcsgWvnNvRWMjDE7hA/8ie5FicSB1OPX2b112W1p9/uoSLogg7Dmj4G6fy++nk1VdVD1CTB2v8n+5NmtsWhkcdoQqpJnbRiMOLDGp8HKMjkwbLKxsqv8QhpdhP2SHbi20dalTbSqdJs3g==</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmFeQqAuO58mRNaN/M3pDc4KJgEkzV7ps3Z0Erp+8gZScgORGM220HflsxuyRv1fjmmVWwQjFKut/K21lUMJnaLZuZqIniUqhQH1ExwJu4/hEzzPrYg3QRmbUkQyuCGZ1w</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22TgUTPZ2dcLCXC0JLs+ueAI=</Encrypted>]]>
      &ListScript;
      &PostScript;
    </text>
  </script>

  <response>
    &ListTicket;
  </response>
</dir>