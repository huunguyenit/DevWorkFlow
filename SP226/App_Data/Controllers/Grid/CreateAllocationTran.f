<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY ScriptTag SYSTEM "..\Include\Javascript\Tag.txt">
  <!ENTITY UnitTag "dmtk">
  <!ENTITY % Control.Unit SYSTEM "..\Include\Unit.ent">
  %Control.Unit;
  %Control.Unit.Include.Account;
  %Control.Unit.Ignore;
  <!ENTITY k "tk">
  <!ENTITY Tag "vdmpb">

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="vdmpb" code="stt_rec" order="stt" filter="&UnitFilter;" initialize="&UnitQuery;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Bút toán phân bổ tự động" e="Allocation Transaction"></title>
  <subTitle v="Từ kỳ %s1 đến kỳ %s2 năm %s3." e="Period from %s1 to %s2 year %s3."></subTitle>
  <partition table="vdmpb" prime="vdmpb" inquiry="" field="" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="stt_rec" type="Decimal" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="tag" type="Boolean" width="60" external="true" aliasName="cast(0 as bit)" filterSource="Tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="stt" type="Decimal" width="100" allowFilter="&GridListAllowFilter.Number;" align="right" readOnly="true">
      <header v="Số thứ tự" e="Ordinal No."></header>
    </field>
    <field name="ten_bt" isPrimaryKey="true" width="300" allowFilter="true" readOnly="true">
      <header v="Tên bút toán" e="Description"></header>
    </field>
    <field name="tk" width="100" allowFilter="true" readOnly="true">
      <header v="Tài khoản" e="Account"></header>
    </field>
    <field name="loai_pb" align="right" width="100" allowFilter="true" readOnly="true">
      <header v="Loại phân bổ" e="Allocation Type"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="tag"/>
      <field name="stt"/>
      <field name="ten_bt"/>
      <field name="tk"/>
      <field name="loai_pb"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75/LoBZviloreISoXiuNrsxnQxz1nixKWWZTMuX0kWwFNf3r7XNPX9TByWwLXAuvs0A==</Encrypted>]]>
      </text>
    </command>

    <command event ="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL753W7sVkJn1qX8G5AYCGuxo27k7doDhOZ6XpLfnT0eqn9wQ+/VVs1oUSBRCadbvlPbYSzBcawku2T2vsU1Q3RHV8=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL753ZOxbIC+LxbnrSHSw7x7wObkPS2H/Bx4sZhA2uYq2nGvDFzd4RWXLmwgc3k4lAkrqBSb8y/ZKu8bw12Es+n/4c=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXzbQrSh4yzrH2nmccB0eyrbLgAPGaCuzvBahu528iCkDAfn5m2M2SeBXHdQL9cgSizGMKFNDGi7kk3OPlHt8YFcs9h9ByoJSgqur3fhcrkxN2RVIdOoe+8eKQzS/bgkH9V+beZCGk9uBmAtzz7zsnes7a6rERpR2gnx/ftUsSfRGZGksKSRhYuIA+vpJrQi2szEY/iU6Rzo/CWSGkAa9iOZSxbzO/d99NxsClwSRDGf4RBayZkwg3wpSkbWpOzLmuodhhTr+N650BGMPIxGzE4SkGLktuPKiycdnFj879kC4KHiefE9dyd7E1gGAXstQVAQ37hFU0hfxhDN2pa5BU0JOsnyQmLqfowyVvpz0No2ha48ZiZ8Z7NNZYKBXKFIhKIfV2Fc4SA6T3FhfsZx82lfjXfztS9WV8AeuCNuO1vzBejqQZqpaQc46xTu8fO2MVyP9InhFW9EcKs68LN+hWFc9uXAyRasDOUzuojsLpBnzvBALy0YgaiVPpMod5wyeFl3i2VWn/i2g0ylyRLZ24JQWdN17c31ZZ6HYExlKUDB0/CqE2G0CqQN9J7VhX14upALCjt8tvsw01HbTpt6IZkOo3G6t4r/fB8ZCNJ3aQ/4b69CUdLAU3/JCym3xQMG9KPDxJXyRajtMi9muKjasIJ1h/+J9WIA0FK+PwHhkirNulMPXz0TgRRl+fwjy8iI0G0ZHp1T4+1r/8S0MZL91zBE7HsP9OeSBPgcEO/7pRFYY1cineQ7WU8UekjIS/uIZ9YckTpjm+HvcmHEr0bdMJ7KrwSARhS/1Zz3u8uAg6gz/pWYjKGfwzT7JWgBKgo/rVI0/XoFZlhiJWuvUOOZf+j/SHfB08RCOvJFbF4hxHx3wdLzIK5SpaqApomSpOC84+UB+THn2mmTlNtaRGasMjYDee3sS11SmBRhN/uwwZuZ7uJB32PQS+9mduOBAmHZczhpQJCsGsxwgOrkQ4cB1dKrPJi4161CZujr0Qg/9VYTAG9TTLywu1ncLYIBKkDefA==</Encrypted>]]>
      &ScriptTag;
    </text>
  </script>

  <response>
    <action id="Calc">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6vwF1B7d1GySFdWppW9fqZtKx1ZpaF1lhZoLW3rfhQU86xeKx0FEifHB+h68/orujIBH3ECw109w/6hrIQ3eyMraDu1bU+nPxnuRwfHK7+QQjYGOlT5x0aNZGUQWG0cOwvRS4MrY+dPQmMNnxRt8i4+JYs/Bz1Lta+3cs6vylWO+qbe/OYmfG+2GXntcl4+C9CYTQ1Ry0Cz2db4Hjorf5JjTp7TfAoyYXERPuzvvwIU9tTenm/PdCbgkw1yF8kRRqwI6NTHjU1g4ANd3R1czl6QEpQL0r5DaCRACyS8nh+6CdJj5KWyF4ysFX9IlPMxVAYwlqn2zoH6KiksiPeBXJEVYBQSlF7o+qkNUtSkxdBEmZJA7TsEWej1W8JHlPUy3RUr+xOzRRG/+L3nrhAIdeLJ2s3SvsR6ylv1qzFcVLYsK8ONFSAyItL/CpybeBrN7BgWjxq3JOZkU20DUYy7CHrwzg1gNqwZ1AnQXru1ve88ujiu14eryG9Wo52hiH0FZU3RVx21SuGVa64Ydp8QPkeek2XvPMd9hth6YnuRx+PFDJbGo/vMq1DUaHlqlmyivj3FiN6iUIf70OzrAlSbPXmajRE+HNy/rmSfHVgo8res5dgkA3rrv7kvQQCavjkJOtIsqkwjcZN5uUuAWsqs9qP9K+EmllVmR71cgBaVYN23SW87xttbjNWr2JcsnCQb5HnUXz+LAa+0XQrXaB13N1kDLgbvMKSJLNE32DOgy9SDV1SYR+Gu3cfezHaCtA269T7hq6BNfvxU1uJvAX3p/CWaVu2zFCJeZWH7i2a0iKsbNoYzstwZrqR01QSV7ZViq+5dFOCaff5cS+6lACZRQ6lXgDSjUmLMMSQ4yqohO2yl</Encrypted>]]>
      </text>
    </action>

    <action id="Allocate">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6vwF1B7d1GySFdWppW9fqZtKx1ZpaF1lhZoLW3rfhQU86xeKx0FEifHB+h68/orujIBH3ECw109w/6hrIQ3eyMraDu1bU+nPxnuRwfHK7+QQjYGOlT5x0aNZGUQWG0cOwvRS4MrY+dPQmMNnxRt8i4+JYs/Bz1Lta+3cs6vylWO+qbe/OYmfG+2GXntcl4+C9CYTQ1Ry0Cz2db4Hjorf5JjTp7TfAoyYXERPuzvvwIU9tTenm/PdCbgkw1yF8kRRqwI6NTHjU1g4ANd3R1czl6QEpQL0r5DaCRACyS8nh+6CdJj5KWyF4ysFX9IlPMxVAYwlqn2zoH6KiksiPeBXJEVYBQSlF7o+qkNUtSkxdBEmZJA7TsEWej1W8JHlPUy3RUr+xOzRRG/+L3nrhAIdeLJ2s3SvsR6ylv1qzFcVLYsK8ONFSAyItL/CpybeBrN7BgWjxq3JOZkU20DUYy7CHrwzg1gNqwZ1AnQXru1ve88ujiu14eryG9Wo52hiH0FZU3RVx21SuGVa64Ydp8QPkeek2XvPMd9hth6YnuRx+PFDJbGo/vMq1DUaHlqlmyivj3FiN6iUIf70OzrAlSbPXmajRE+HNy/rmSfHVgo8res5dgkA3rrv7kvQQCavjkJOtIsqkwjcZN5uUuAWsqs9qP9K+EmllVmR71cgBaVYN23BYILBt1ZVJBPdsRyzTCF6OR1WTi2Xep4hEWnfvyeMJkKp15RnIWGSwiEGihOMXEHFTOTF6IQdkGR3VKRHjHmZ918k1M0Du7F6aCrGB7m0XKcdwbZCA1ybURWci1IBj6737cb14DdnGNVKIvR+CyCrhapeFYf2ciNCx68FhJhpxa4trsbbxtxwA5sOID/Q293Sup7CekLNA/5h9ZE642LClWGxbjFBJDC8Z0b/qERGntDtGxgbYlIfKB/+DkbMDbbsujj8LPdq/6d9silD2OR0w==</Encrypted>]]>
      </text>
    </action>

    <action id="Truncate">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6vwF1B7d1GySFdWppW9fqZtKx1ZpaF1lhZoLW3rfhQU86xeKx0FEifHB+h68/orujIBH3ECw109w/6hrIQ3eyMraDu1bU+nPxnuRwfHK7+QQjYGOlT5x0aNZGUQWG0cOwvRS4MrY+dPQmMNnxRt8i4+JYs/Bz1Lta+3cs6vylWO+qbe/OYmfG+2GXntcl4+C9CYTQ1Ry0Cz2db4Hjorf5JjTp7TfAoyYXERPuzvvwIU9tTenm/PdCbgkw1yF8kRRqwI6NTHjU1g4ANd3R1czl6QEpQL0r5DaCRACyS8nh+6CdJj5KWyF4ysFX9IlPMxVAYwlqn2zoH6KiksiPeBXJEVYBQSlF7o+qkNUtSkxdBEmZJA7TsEWej1W8JHlPUy3RUr+xOzRRG/+L3nrhAIdeLJ2s3SvsR6ylv1qzFcVLYsK8ONFSAyItL/CpybeBrN7BgWjxq3JOZkU20DUYy7CHrwzg1gNqwZ1AnQXru1ve88WW0VDB81DxXhgGn/3BI53eRNIgo/S0P+cl2sxPsNsm6xMSdxzCN+0yJytkrwpirEQXg8BhzMsAVktyHuhG6x7zg/z/451VIcT+bO07bbKNR4sZ+NTMFFggUFItX+fl4bumCw7ncy0vTV+/Dm0B0lRmbeot+9VsJIRzRhXEYUK9GNrKkWa30KfVSAcFRQM8VSkcRE1WUJHJtbarbOnqMAJtEr6eS+uhwZLF8mHILQhfCZBp8rvtnQ3lyUdj+WgQZBTXTZdSzn77JbX6QWvf2LN7oOsWUcT7+L433YfhMzXXP6VTIIoLIyW9MF+LlQoYzT6+hqWhXgDkNqHNWcyJvDTZoKCTVXIsxM/ep5NSjdZMO2CaoioKP93aHCbetJG/us</Encrypted>]]>
      </text>
    </action>

  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7x3hzVjb+R6o+3hwXnmae14JAkAufuEojlgYrzY6gVLLIF+0R030DpWClvBbmneyDjQUmbZRj2AxXs9ZNoetXHe0AKOXuriOmtkeKb3R13xhn3hcA4DIEkJdYloH4N7OELBXnM/ZrGYG7dsqIyM7wCh8td72wSoqIaufxzHUBrzVkdKiUrO2oIhH2G7DgM4bc/AFtT1hFhnYS8CUbseptfBLpCRZt6s4kKN3YQawqrBdKRTu/iZedQmoe+QPeJcB2pIJEv33kS59Ee82SdUZCGhHQ2QGXaZtjeOkCwHGGvnFEpcZZavJ+H0JeBrydU+waRaOORc6+rfHr03k321Al8=</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Calc">
      <title v="Tính hệ số phân bổ$$120" e="Calculate$$120"></title>
    </button>
    <button command="Edit">
      <title v="Sửa hệ số phân bổ (Ctrl + E)$Sửa hệ số...$120" e="Toolbar.Edit"></title>
    </button>
    <button command="Allocate">
      <title v="Phân bổ$$120" e="Allocate$$120"></title>
    </button>
    <button command="Truncate">
      <title v="Xóa phân bổ$$120" e="Delete$"></title>
    </button>

    <button command="Search">
      <title v="Chọn kỳ$Chọn..." e="Filter$"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>