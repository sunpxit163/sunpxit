package xyz.sunpxit.domain;

import java.util.Date;
import java.util.Objects;

public class Upload {

    private int id;
    private String path;
    private Date scDate;
    private String leiXing;

    public String getLeiXing() {
        return leiXing;
    }

    public void setLeiXing(String leiXing) {
        this.leiXing = leiXing;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Date getScDate() {
        return scDate;
    }

    public void setScDate(Date scDate) {
        this.scDate = scDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Upload upload = (Upload) o;
        return id == upload.id &&
                Objects.equals(path, upload.path) &&
                Objects.equals(scDate, upload.scDate) &&
                Objects.equals(leiXing, upload.leiXing);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, path, scDate, leiXing);
    }
}
