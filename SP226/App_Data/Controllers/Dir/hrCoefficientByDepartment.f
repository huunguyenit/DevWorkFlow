<?xml version="1.0" encoding="utf-8"?>

<dir table="hrhsbp" code="stt_rec, ma_bp, ngay_hl" order="stt_rec, ma_bp, ngay_hl" xmlns="urn:schemas-fast-com:data-dir">
  <title v="hệ số theo bộ phận" e="Coefficient by Department"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" allowNulls="false" clientDefault="Default">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" allowNulls="false" external="true" defaultValue="''">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <items style="AutoComplete" controller="hrEmployee" reference="ho_ten" key="(@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)) and status = '1'" check="@@admin = 1 or bo_phan in (select a.ma_bp from hrbp a, @@sysDatabaseName..hrquyenbp b where dbo.ff_Inlist(a.bp_ref, b.r_access2) = 1 and b.user_id = @@userID)" information="ma_nv$vhrnv.ten"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99IA9QaOh+GcFEGUoQDSdBP+lv8KwmINcwkC8TMXlNkc11NFK3s1X1IwwSyjfoSmbRZCSZgRfyZ2jEEFEIhPqtjU=</Encrypted>]]></clientScript>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="he_so" type="Decimal" dataFormatString="### ### ### ##0.000">
      <header v="Hệ số" e="Coefficient"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ngay_hl" isPrimaryKey="true" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230, 0, 0"/>
      <item value="1101000: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110101-: [ma_nv].Label, [ma_nv], [ho_ten], [stt_rec]"/>
      <item value="110----: [he_so].Label, [he_so]"/>
      <item value="110----: [ngay_hl].Label, [ngay_hl]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIQNNZ+u0P1Xhx7KMnIVD/QyGppN/s+aFiNBinW3xdOUaLIQGV084ATpxmOWVM1mqW8UxnSrY7PLusIJomd1+U5Lea0C/wZhgOsO0qO7KwRv</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMSOYwq+Np5HXPCe4VgshOATpXRTv5jKp8qB+6k8WZ+Ia161PvW+w0oypaW8rHlh0bfTX25LJKTeyq1wFNKndtTb8O9QpSfCbdNUb/7MENNA</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJI8HEW4waxZh7TSHkaQApiU1BTpOXZK+Ti+bgFf0KUnoMAkBqQiXUR51vXHzmFESAGry5hmq2kG8t01Ydd5KlZjEvnkiepSmZuH8LQdrCCN</Encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5wYSL54cQwpc6EiB1XHUdKnKfGkdadgCzywju5Y87VGdCNpd4KFOwYQ3UljlWMVXlKFtOLx4LCbu2rM2T3SERfAKf8MLpn4h6Pf1aSmLg7xPQuXZpWsRZ2Yhr6juAgXEPJ8lKuVfg3TcbDGp+IMVvs3Fwxztkm+CcUxgDUGo2uNgDAcrd5KCJCfZIhWPV60ag==</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2idkLpCXzrimb1YuTMpb3af99XLCv10PE39uENjugvgjGlsRTUGxoPhirmhCio5g+oL+NiiXRbfrT4zEroRgNIkHibOl3ERiVHBlw5eAxDeKZyQJHRr/+gq/RT31OTYGq6gUEunEaBPgAEyy4T/hQ18ZqpVC63n46ZywWWhdxxrRMrUrElOzpVp7bTKTTHOLgHzefbyUUHz4ASsIZO5oEqvjMiqUNhx/FuaghPJeai+bQuNnVjmBkSfBca+pWvaGbjpAgscUe5BDc9Upv1I1wbtCJpf88qLMExf92QYkOZp6dZCDwCy9rvxD84YQN7cnftS9K/BL/hGfZxVulKVmBzU4eu6XsXpNb1QFfRsc9Q7z2wrAi5MARHuGYgXkXQU2XUHLJsPr8EoQaaqYwAQzRpVT7ctz/GYw7c5Zt0WIv0l5r2vG+cIBlGWNQFkJ/JZ53586/syjymqt3YCyyONPrqrCA9WCWp+G5nu+JE2bIrHg==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwU79VyRyBChN7cVg/V7eyUlXGJaDnyO8Nxvij75H4+D/IR+GJia/N1rJXUTtgUuOMu3MN70QNhaQ9E5Xlw0y65g7IUK13gio2lNcI6KAQ/PeeRWmQkeCS64Ee7T16TDmC3XiQ5qZJoY67+I5EWg6xKfyeSVKdBjseaJVmAxTfSyvr3Rgf5epCC64Cmyr1WozXlKWtvmRAaGBqSfjKHRi9+KQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLzHVitzF8ntYb6OKtVQ4RkyckyQedt84RIbvqffS/QpjFCuaA6GFzxnUrEtEA+hhsBCNN4KhRkJfrJrGqZH42xhUibkGvLt7ZzZbJvaKtuztGkaaKCX0R8n0BaYI9qHshOXoxpQ6fOCch9e2hk7omLh3WO2W/UONMIrHNGD6fH7oiu9Jv7++xCvwlI+Nx0jrMpjCl7ErgenqWW4g+jh7A5arl5QXWqe6B+7dqTEIddjDLOeE9+TH2H7U/51Ss1C5+yBq+WQ+RBrz0a1pu4qsskg==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz1A0c5BwgEd6wiLsAjFO5wS7ri+7RIHHWN4fjpX/GhbiRtJBASe/a5GsR5uEO6XV1kKnbVoNF2njbwUgFKK4xtVdLXQJmRO8SGVizoqo8LbkLJUfQ4BDAzSuDmZonwaODdr890HaAzX6Ik8vt0rQRA=</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtRTb8ZaqYkMgnf3O/ctybZXzZoB73td7ptsCgolFnFgHbYBEp26jKxAK+1PIb0ltuCSc8aql4luyEDF//KOgils62iuci5rMYc8cNirVcjrRGY6WH1WilOMARVqbqJ4KZ4xKekvdGlY4PpS9aSOjmZard7ZlacKlHOuiAq35mDFFO5WZe1MR/iXGlDx4PoS1F2JGeQgg3+OlJVFeHZY2K1vjEfKeXHJ6o3xKGvgePEJ5ulTsmT/EdahuLIa368xHxrgXThkX9lfm43YpkETkSBxZDtQLrd5+klmT/ndub5X81vXEJCKGpCJdtEdAPObqjWqjXohRli16z50+MGplcLEKLUlxpgMILqlg0k+oQv9NgxyzBpRZqH5tSkCoA9LQy2YCbJmVdK6XqdDfLjxLRgXq080+S/wn1nBwo2x7H8JpjUW2P5zPZPL+CGyy32rAw47wGJdGDjxgKUn711eUlV0=</Encrypted>]]>
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